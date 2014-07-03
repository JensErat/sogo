declare option db:parser 'html';

declare updating function local:retag($html, $class, $tagname) {
  for $tag in $html//(p, span)[@class=$class]
  return rename node $tag as $tagname
};

copy $html := doc('/home/jenserat/src/sogo/Documentation/SOGo Installation Guide.html')
modify (
  (: clean up header :)
  delete nodes $html/html/head/(meta(:, style:)),
  
  (: remove generated TOC :)
  delete nodes $html//p[@class=('p10', 'p11')],
  
  (: retag headlines :)
  local:retag($html, 'p9', 'h1'),
  local:retag($html, 'p14', 'h2'),
  
  (: retag source code :)
  local:retag($html, ('s1', 's2', 'p17', 'p19'), 'code'),
  (: TODO replace contents by text :)
  
  (: retag quotes :)
  local:retag($html, 'p40', 'blockquote'),
  
  (: retag list items, TODO put into list container :)
  local:retag($html, 'p12', 'li'),
  
  (: remove empty paragraphs :)
  delete nodes $html//p[normalize-space(.) = '']
  
)
return $html