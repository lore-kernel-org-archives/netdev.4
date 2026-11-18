Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017577;
	b=thtIRF3PSVdwf/AJ2OsHbD+EDFUcOILeDsIo1y4lxbSGArl0PqrmNphGrchVElw+Ziwv
	 fkilgxs+l0+5FTp1ZtB8VH46RJ3mXJAuoi1gLG0DGGe/ezP2IgXZQTvTu4Cn6l4WrAaBJ
	 AW2ninm3gtBdRed+SPgdqlF8fcPzTvX06DaEOmp0QX1dmlEk7CEwY4w/u/xeYlftK54TW
	 Kift7YFk5chH/HdZqOewxSiigpsCg4yswmOZWNGkwWSjwJLnTU20PYr4ertnZgoD8tyAg
	 pjcLiFuwZHR4Uq29O4BOpQlBMJH0/l09mbdQOkFhxZS4eWxJFLKRmCRrylU7YNMwcPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017577;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/h9rgXrfF5u1ci5MS4XgrHJyRv+KAHpfbsqOKTTt0mE=;
	b=lBWLgcEHnY8uioLy5liTb+CdWDj/FGSNcgLBvaB2Yz0y4/3ctm1/ezOPGvAPVl8DQzna
	 wKAx7VYTXfbL91IgIqwR0eBH41G00SNeVC8Ry/H3ZV25mbVUuk85IrldTSUg0SHgpsfqZ
	 FibHjdt7fPYhFOjHt3Q6faS6KOGduGe0jTa4K81z1iFexN8jg0iXJt5/utYXnqunset6N
	 /9+XNuKgyN+vubxxaICJaoMcqX5dIYFK+oGek2cPt7RrpIQloZdxXeZNcwq2mtSb/FQpZ
	 a/r4PmAAHLJ2MMq2f85zhx7tXfqUQfVzjzsAOn0F32VRZ82qyrHa5AuyyMu2+tbJiQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Fln29ZwT;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C9D606A320
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 15:59:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16C9D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Fln29ZwT
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso11158405e9.3
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 07:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795017575; x=1795622375; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/h9rgXrfF5u1ci5MS4XgrHJyRv+KAHpfbsqOKTTt0mE=;
        b=Fln29ZwTeNU/hpOkxJGZye3iOySM5HLQZY9DFRfKDDUmFl4L4shxRbTg2kjRQrHxfw
         U70HTi9A/FZ8W1fYk/bJ1Kcut92DcrnB1FrRvuMncX25dIGMcyqFCZBU4MgIjnxykVnW
         q1Ka3Z7v0VHlOQ73sf0MA5Ek7wvdTOmpeUhlklhvYpxi4f70vQU75YR7z40YBgISxWuh
         Gihap+mOK2WDgj638bjqZo9ON3eZ+3jMSCagrQXLs1Ji3s0I8jZR11xCZrqCe4TgQqc9
         asuGAGxKt7KDKI50utY+52BZS0Fyx5puP+nK63E94MJqSRHh5C5LmMITdWDKR7Z07kQH
         2SiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795017575; x=1795622375;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/h9rgXrfF5u1ci5MS4XgrHJyRv+KAHpfbsqOKTTt0mE=;
        b=yEp3etN7zopQSzZ1trFzCU9hwtSVmnQY44VohdlMhCFYX8n/VU0N84nYsmgoT4ikHt
         6kEmntbj5ELQNOVZ0fB6f+39oWUwUpIdy0anSYtMzs6kLpx5Gh3gtf7WWllouqJK7vSZ
         /Fby7ZGmXfQEMt2xB9AVrijN2Tox33pm1XsEWl5pOhdKHJZw8KOPnBJeNU4vn25O84oB
         sWZUxk3EKcxhJadqn0RvV0dzRtaRHNn3aSAcjcGDwH2BjfGDi7NI4fIIrQf3gL5RP2/N
         u7gRx0LciomMrQJsigM8HHTOWNumP7SxDIakftxA75G9KdtAHE2oXMeMwfcdr8VIKaCg
         cfWw==
X-Forwarded-Encrypted: i=1; AL+hErEvOKe2kAmmQ5RcobVH6a8peDc260gHVIb744ZkPEGMxYIh+qnK0orxEQH2PMync7wC51uzV/k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Fk2xoogPaitSbAQpWJr6iLkPKhwecdvaliiEVU9bblSWnsMnY
	4us4+jLrndMHEfIULWl4fK4J1xpDpP+08KLwcip4OtTFKIPlSU6Cnb7+TwP2c59TspQ=
X-Gm-Gg: AYBFou2Yhf5Wn/KHt2+qiXM7yBetmNC8J8ClGkhgJ4fXIFxcvzumttKNtGjlsHmdezA
	MEPRSvuHl9whTkdL8yhFWc3FT8FPZn4+Zw+6HUXzrSyPRGJ25Q0si5GlLtHfMNv32SnXtvNCfXN
	doIlVPjbKznDly/e7/q3NezaS2gi94lZCZyWkyUms/fN6pLSfXRSVu4TkOYQlFJwxGBD3cXByzS
	r1i5SCklHDpowjtCNeLHTYUPWeYhIc+jVsAe9aZN6GQtyBzUTuMn7Jk38/3PyNe2qZ1HLuo3lga
	R5tyNW/kUKi5n0GM7DrDtUcky/YckMUsusxy+sxAvu4f8mzM5pwX6OVND5XuqrH+ZM/VhxAXpCH
	o2uy4nhNO0LvmCoZGTn8RbzYa0GqsQJ6X1OdEs5HnrG9bp898NJqoQdh8f1zY7Rx1UsXBq01jPz
	qNQHuBDCMr6+HwoGH5COGv1hG+3obZBv6/wfdeK27ENtBYb3/QinNJfFifja+trc3OvYWBPcZK5
	dku3BzF6TfTAZkcIh6NmNcQHWKdUBSweN9G/ojo2vuZkVuGYtcPjsAZ/UtESE0Jos/LPsEwhWFY
	qAlNYXL2ZsuE3e2gkUOQ0g+0YU2IKP4nEpsE9Kr5jh9suw==
X-Received: by 2002:a05:600c:1da6:b0:4a2:133:45e1 with SMTP id 5b1f17b1804b1-4bb7da34ef7mr56355545e9.24.1795017575257;
        Wed, 18 Nov 2026 07:59:35 -0800 (PST)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7840b05bsm224055145e9.7.2026.11.18.07.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:59:34 -0800 (PST)
Date: Wed, 18 Nov 2026 16:59:32 +0100
From: Petr Mladek <pmladek@suse.com>
To: Breno Leitao <leitao@debian.org>
Cc: Gustavo Luiz Duarte <gustavold@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	John Ogness <john.ogness@linutronix.de>,
	Sam Crossley <samuelcrossley@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH net-next v2] netconsole: register one console per target
Message-ID: <av3LZA_ZemI7ov0q@pathway.suse.cz>
References: <20261110-netcons_one_console_per_target-v2-1-bebf45b2733f@debian.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110-netcons_one_console_per_target-v2-1-bebf45b2733f@debian.org>

On Tue 2026-11-10 05:10:01, Breno Leitao wrote:
> netconsole registers a single console (or two in case someone wants
> basic and extended at the same time), independent of the number of
> targets.
> 
> This was not ideal, but, there was no reason to change.
> 
> Now that we want to replay some messages [1], we cannot do it per
> target, but, per console [2].
> 
> Embed a struct console in netconsole_target, so, each target has its own
> console, named `netcons_<target name>`. struct console holds 15
> characters, so longer names are truncated, and two targets can end up
> with the same console name.
> 
> No ->match() callback is added: netconsole consoles set CON_ENABLED and
> register without a console= match. console=netcon0 no longer refers to
> netconsole.
> 
> Unregistering a console waits for an SRCU grace period and for its
> printer thread to stop, which the netdev notifier should not do
> under RTNL. A target stopped by an interface event keeps its console
> instead, and the write callback skips the target as it does today.
> Writing to its enabled attribute drops that console.
> 
> The console is replaced when the target is enabled again or resumes.
> The user may have switched the format in between, and printk has to
> format the records the way the target sends them. A target whose
> console fails to register is disabled, as it would not print
> anything.
> 
> Today, a target switched to the other format while deactivated resumes
> silently if no console of that format is registered.
> 
> target_list_lock remains the device_lock of all the consoles. A target
> is enabled before its console is registered, so only disabling it and
> interface events race with the write callback, and both change the
> state under that lock. The printer threads of the targets serialize on
> it, like the two shared consoles do today.
> 
> /proc/consoles now lists one entry per enabled target, and per target
> stopped by an interface event, for example:
> 
> 	netcons_foo0         -W- (E  N   )
> 
> This makes the mental model easier to understand, and also simplifies
> the code.
> 
> --- a/drivers/net/netconsole.c
> +++ b/drivers/net/netconsole.c
> @@ -1134,19 +1112,6 @@ static ssize_t enabled_store(struct config_item *item,
>  			goto out_unlock;
>  		}
>  
> -		if (nt->extended && !console_is_registered(&netconsole_ext)) {
> -			netconsole_ext.flags |= CON_ENABLED;
> -			register_console(&netconsole_ext);
> -		}
> -
> -		/* User might be enabling the basic format target for the very
> -		 * first time, make sure the console is registered.
> -		 */
> -		if (!nt->extended && !console_is_registered(&netconsole)) {
> -			netconsole.flags |= CON_ENABLED;
> -			register_console(&netconsole);
> -		}

What is the expected behavior when people repeatedly disable/enable
the console, please?

register_console() always initializes con->nbcon_seq, see
get_init_console_seq(). A solution might be to keep the current value
when con->nbcon_seq or con->seq is not zero.

Alternative solution would be to add a flag CON_PAUSED which would be
used to temporary disable the console without unregistering. It might
be handled similar way as CON_SUSPENDED. The point is to make
is_console_usable() return false when the console should stop
emitting the messages.

Note that we could not use CON_ENABLE because it already has another
semantic.

> -
>  		/*
>  		 * Skip netconsole_parser_cmdline() -- all the attributes are
>  		 * already configured via configfs. Just print them out.
> @@ -1167,6 +1132,9 @@ static ssize_t enabled_store(struct config_item *item,
>  			goto out_unlock;
>  		}
>  
> +		ret = netconsole_register_console(nt, 0);
> +		if (ret)
> +			goto out_unlock;
>  		pr_info("network logging started\n");
>  	} else {	/* false */
>  		/* We need to disable the netconsole before cleaning it up
> @@ -1182,10 +1150,7 @@ static ssize_t enabled_store(struct config_item *item,

The code does this here:

		nt->state = STATE_DISABLED;

>  		list_move(&nt->list, &target_cleanup_list);
>  		spin_unlock_irqrestore(&target_list_lock, flags);
>  		mutex_unlock(&target_cleanup_list_lock);
> -		/* Unregister consoles, whose the last target of that type got
> -		 * disabled.
> -		 */
> -		unregister_netcons_consoles();
> +		netconsole_unregister_console(nt);

Why do we disable the traget before unregistering, please?
I ask because it might cause loosing messages, see below.

>  	}
>  
>  	ret = count;
> @@ -2615,53 +2585,40 @@ static void send_msg_udp(struct netconsole_target *nt, const char *msg,
>  }
>  
>  /**
> - * netconsole_write - Generic function to send a msg to all targets
> + * netconsole_write - Send a msg to the target of a console
> + * @con: console of the target
>   * @wctxt: nbcon write context
> - * @extended: "true" for extended console mode
>   *
> - * Given an nbcon write context, send the message to the netconsole targets
> + * Given an nbcon write context, send the message to the netconsole target
>   */
> -static void netconsole_write(struct nbcon_write_context *wctxt, bool extended)
> +static void netconsole_write(struct console *con,
> +			     struct nbcon_write_context *wctxt)
>  {
>  	struct netconsole_target *nt;
>  
> +	nt = container_of(con, struct netconsole_target, console);
> +
>  	if (oops_only && !netconsole_kernel_dying())
>  		return;
>  
> -	list_for_each_entry(nt, &target_list, list) {
> -		if (nt->extended != extended || nt->state != STATE_ENABLED ||
> -		    !netif_running(nt->np.dev))
> -			continue;
> -
> -		if (netconsole_ratelimited(nt))
> -			continue;
> -
> -		/* If nbcon_enter_unsafe() fails, just return given netconsole
> -		 * lost the ownership, and iterating over the targets will not
> -		 * be able to re-acquire.
> -		 */
> -		if (!nbcon_enter_unsafe(wctxt))
> -			return;
> +	if (nt->state != STATE_ENABLED || !netif_running(nt->np.dev))
> +		return;

This is where the messages can get lost. The write() callback does not
pass any error value. As a result, nbcon_emit_next_record() bumps
con->nbcon_seq even when the message was not emitted.

A better solution would be to unregister or disable the console
so that the write() callback is not longer called in the 1st place.
The current con->nbcon_seq could be preserved and used again when
the console is resumed/enabled again.

>  
> -		if (extended)
> -			send_ext_msg_udp(nt, wctxt);
> -		else
> -			send_msg_udp(nt, wctxt->outbuf, wctxt->len);
> +	if (netconsole_ratelimited(nt))
> +		return;
>  
> -		nbcon_exit_unsafe(wctxt);
> -	}
> -}
> +	/* If nbcon_enter_unsafe() fails, just return given netconsole
> +	 * lost the ownership.
> +	 */
> +	if (!nbcon_enter_unsafe(wctxt))
> +		return;
>  
> -static void netconsole_write_ext(struct console *con __always_unused,
> -				 struct nbcon_write_context *wctxt)
> -{
> -	netconsole_write(wctxt, true);
> -}
> +	if (nt->extended)
> +		send_ext_msg_udp(nt, wctxt);
> +	else
> +		send_msg_udp(nt, wctxt->outbuf, wctxt->len);
>  
> -static void netconsole_write_basic(struct console *con __always_unused,
> -				   struct nbcon_write_context *wctxt)
> -{
> -	netconsole_write(wctxt, false);
> +	nbcon_exit_unsafe(wctxt);
>  }
>  
>  static void netconsole_device_lock(struct console *con __always_unused,

Otherwise, the patch looks reasonable from the printk POV.

Note that I haven't tested it. And I am not sure how many scenarios
are possible. It seems that the netconsole user interface is really
rich ;-)

Best Regards,
Petr
