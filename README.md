# heptabase-raycast
script commands to integrate workflow with Heptabase and Raycast

## hlog

Append string "_insert_log_" or "_insert_pomo_" to the bottom line of today page.

"_insert_*_" can be setup as keyword for desired snippets in Raycast. So the appened new line will trigger "snippet expansion" and be replaced with content of snippets. While pure applescript is competent for inserting log text, using raycast snippets allows emojis in the text.

### Snippet examples
- keyword: _insert_log_

```
{time} {clipboard}
```

- keyword: _insert_pomo_

```
{time} 🍅  {clipboard}
```
