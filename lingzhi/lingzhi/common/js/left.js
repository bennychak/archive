// JavaScript Document
jQuery.fn.float = function(settings) {
    if (typeof settings == "object") {
        settings = jQuery.extend({
            delay: 1000,
            offset: {
                left: 5,
                right: 5,
                top: 0,
                bottom: 0
            },
            style: null,
            width: 200,
            height: 200,
            position: "rm"
        },
        settings || {});
        var winW = $(window).width();
        var winH = $(window).height();
        function getPosition($applyTo, position) {
            var _pos = null;
            switch (position) {
            case "rm":
                $applyTo.data("offset", "right");
                $applyTo.data("offsetPostion", settings.offset.right);
                _pos = {
                    right: settings.offset.right,
                    top: winH / 2 - $applyTo.innerHeight() / 2
                };
                break;
            case "lm":
                $applyTo.data("offset", "left");
                $applyTo.data("offsetPostion", settings.offset.left);
                _pos = {
                    left: settings.offset.left,
                    top: winH / 2 - $applyTo.innerHeight() / 2
                };
                break;
            case "rb":
                _pos = {
                    right: settings.offset.right,
                    top: winH - $applyTo.innerHeight()
                };
                break;
            case "lb":
                _pos = {
                    left: settings.offset.left,
                    top: winH - $applyTo.innerHeight()
                };
                break;
            case "l":
                _pos = {
                    left: settings.offset.left,
                    top: settings.offset.top
                };
                break;
            case "r":
                _pos = {
                    right: settings.offset.right,
                    top: settings.offset.top
                };
                break;
            case "t":
                $applyTo.data("offset", "top");
                $applyTo.data("offsetPostion", settings.offset.top);
                _pos = {
                    left: settings.offset.left,
                    top: settings.offset.top
                };
                break;
            case "b":
                $applyTo.data("offset", "bottom");
                $applyTo.data("offsetPostion", settings.offset.bottom);
                _pos = {
                    left: settings.offset.left,
                    top: winH - $applyTo.innerHeight()
                };
                break
            }
            return _pos
        }
        function setPosition($applyTo, position, isUseAnimate) {
            var scrollTop = $(window).scrollTop();
            var scrollLeft = $(window).scrollLeft();
            var _pos = getPosition($applyTo, position);
            _pos.top += scrollTop;
            isUseAnimate && $applyTo.stop().animate(_pos, settings.delay) || $applyTo.css(_pos)
        }
        return this.each(function() {
            var $this = $(this);
            $this.css("position", "absolute");
            settings.style && $this.css(settings.style);
            setPosition($this, settings.position);
            $(this).data("isAllowScroll", true);
            $(window).scroll(function() {
                $this.data("isAllowScroll") && setPosition($this, settings.position, true)
            })
        })
    } else {
        var speed = arguments.length > 1 && arguments[1] || "fast";
        this.each(function() {
            if (settings == "clearOffset") {
                var _c = {};
                if ($(this).data("offset")) {
                    _c[$(this).data("offset")] = 0;
                    $(this).data("isAllowScroll", false);
                    $(this).stop().animate(_c, speed)
                }
            } else if (settings == "addOffset") {
                var _c = {};
                if ($(this).data("offset") && $(this).data("offsetPostion")) {
                    _c[$(this).data("offset")] = $(this).data("offsetPostion");
                    $(this).stop().animate(_c, speed);
                    $(this).data("isAllowScroll", true)
                }
            } else if (settings == "setScrollDisable") {
                $(this).data("isAllowScroll", false)
            } else if (settings == "setScrollUsable") {
                $(this).data("isAllowScroll", true)
            }
        })
    }
}