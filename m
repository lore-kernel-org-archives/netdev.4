Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795412042;
	b=R7sLTeBp/ww5KUadpDue8YIgHMRdBziTqYLW8BA2BOL490zizzSZJ98VXLV6E+HdcS1P
	 GpALgPLqkbL49dAEpB9EVP29v+amAb8M97P43QlXdMK47OAJJQMXafEVgBSXcCU54sMqm
	 prqSosZ2HGnE49jcRXEUZnTCjRPSePb0cMYd9ALJ6X2uQYk0dlml9kdSl1FmGtUxNz5TE
	 hORM9CyRQgKj+hwG4LjYImFcDNMHJ3cmzOXt69iL4NX4jGkyaru7FWiVEurHLMAtje6Bj
	 ak2JBkp/XQp4vKR2W7qk3eq+qwhgBKzUuUAB0LXVsbvT5oftjEA9VLb8zx7YydJ6mgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795412042;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9o7mIcgFppX8T6/hMv/UY9Gl7Tlm8l8uHqJJUggg9Ig=;
	b=IFg1zIsaLS6PKwptnFNbkkhGUXqlLcRQnbWudXychXl4WBkQGmTEYCEFoNRSXuG4JHZ0
	 uJ0v6/N4wFTzEzFvXHX5K6yUg2oTo0wOWR05qP+Q8dt2vu+mXXFFC+QwkcrdvcjW7/fOW
	 2+oYF4KvKvc+Pbw1s2P/b0krnVCkqhkZBm5TZJ71HcvOO7vFsQtOcoPpOrVBTNMfyhzYI
	 4ZopEqNexjR6vzgLdg8fkob7Hc3duhH5xlN8v7JbkPPOMrEFFgPcFnxpIZ8yX7Rzc74t/
	 CY6XBH09/PDIN3RnyS8kH7bRRHiLdyZ4wEegqQVzaTiIgbhX9oCFHQigLEhMZy63DEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h52OV8tA;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DCA606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 05:34:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00DCA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h52OV8tA
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33fb4680717so8138127eec.1
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 21:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795412041; x=1796016841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9o7mIcgFppX8T6/hMv/UY9Gl7Tlm8l8uHqJJUggg9Ig=;
        b=h52OV8tASbZTwpK+V6Zj08abQvNF3+DTClYLKeGA7S9RMbS4GnANRhME0s8M8Wythl
         Ytvngm1UqnPLZ+x2ZTBriwOl3Rv5nVGsDLVurvMxvw7vbfT2wdvCRssJsI/bJeaK9aZi
         kaDoc9W7UAARtrFuTFI6u2R/+z/3JNbDwlq6z4B6BrRpKxfRr8pFliugDVodG2dDqa+f
         HYo5uaALwee2JqEM6Jci7gBeMNvsLhfx1l0HevL+P1/DfU5F0gDyIJLmMA1bGUb3ly4c
         BYfsG/uGKI62bAbBCJt1+BVZAx6LemBMfwGxQRo40t7LOF0Q7GMPeth0PP8QGVNdsJ5Y
         THMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795412041; x=1796016841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9o7mIcgFppX8T6/hMv/UY9Gl7Tlm8l8uHqJJUggg9Ig=;
        b=V8RhRq9DUED+Ia5SU/efDu+/XxHHAm8Nifzv7OD9Y5IaAjTl53W8N75XUgcQ3O4Kud
         dbvb74Ru+ln9eoZiLfT+BRSaHP9rAYhD/OLQR84OonbuvspkqQodObWePPtKTUEiGfE7
         JRrwqrLho0H2gbZyD60Cu1hPifU3urFzBqQnAl1WGpu9w3igGEH079B6bo9TmB62o9JJ
         XC3fS44pbIiZyRrFMOk56Wt2gxjVweMH4LZN4M1bKWQzpmSDnS6ZnGfkTsPguWanEydv
         Px2MTLUmwAgzmjHVDK7gkRuPAk2Iw/0WDlyROy9JEUuklSskmAGnKtjVDeP4eYPBk9la
         eNfw==
X-Gm-Message-State: APuU4Z+k7ERhHou3pfnIVH7iKftQ/Ot7uLzH2IgM/xPuRmtXXel/FwY9
	HSY39MrLnlIfwI0m7vdtuY15l8OInN+3zaH20xsXh0D1pPGsBsJgq9s0TbliBUSyxW4=
X-Gm-Gg: AZFdTZciIaSDD0+MjqyoXzFD1z6gRGGhbmss8RaG8cTLHO7To8zDywaK1hDRcIVDk/V
	wlr3ZeB/mkb63AX9uJVbqnEMd8vg4N2HI6DadcQc5hp9/9Q5VygXZMEeyKDlUx42zLaZqFGQFy4
	tJY9P/eqidDmB8tTUsvYuEEoASm3NAy2qZuyhc3PfDG0Huati/6S61krTOZ8FhD6U1tIsvumBdR
	VyobM4Qj85QQmntDByy2EvMmooJwz/DMup7lsiCCOtPyBMQtBntmcMCwbzg1GWvGQgFP1xpBGk5
	zbw3caNWC2r7UP3YDXRwurlMKRI9auIIqulRiRr6SvazdSzkoapIMm3RdqdlKDsy0C6ZfAXWQY8
	/8Fu0RWTlldGKmKS5CVB+IcWclkjNjWs7dW/dLL1KhGlYJi8FQ1brUzyikIPlPyjUq2z3Y8zsFY
	/iqWsN68Ng0TT7u/qVYuq/7JgI12jaT/2WVJ1x7DN8YBdHffiowQa2vakq71cZ13P69ax5IlcX+
	NEnC5lnjSlSvvLJnALSSWFd6mbsJ2YVcuMZ+CThzWtgPXTKarQrv7ftTcmTqJpezEB//dAYUKCl
	SilosdGNnQttuy5+bIc0xjOFwDBdm8wqEfrUk9wv5E4JBTpEvDezv1l48lUzCyi3AA==
X-Received: by 2002:a05:7301:182f:b0:385:cf42:9b9b with SMTP id 5a478bee46e88-385cf429e7amr10893001eec.8.1795412041012;
        Sun, 22 Nov 2026 21:34:01 -0800 (PST)
Received: from ptathe-thinkpadt14gen4.rmtin.csb ([2401:4900:1c17:49db:63b5:cf7d:da25:ff37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38577214c2dsm30826894eec.17.2026.11.22.21.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:34:00 -0800 (PST)
From: Pranav Tathe <pranavtathe30@gmail.com>
To: netdev@vger.kernel.org
Cc: David Ahern <dsahern@kernel.org>,
	Stephen Hemminger <stephen@networkplumber.org>,
	Pranav Tathe <pranavtathe30@gmail.com>
Subject: Re: [PATCH iproute2-next] ip-link: document BOND type options in man page
Date: Mon, 23 Nov 2026 11:03:24 +0530
Message-ID: <20261123053324.24403-1-pranavtathe30@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261116143553.1b051ab9@phoenix.local>
References: <20261110142527.257436-1-pranavtathe30@gmail.com> <20261116143553.1b051ab9@phoenix.local>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 16 Nov 2026 14:35:53 -0800 Stephen Hemminger <stephen@networkplumber.org> wrote:

> There is a tradeoff between more complete man page and duplicating what
> is already in the kernel documentation. I would rather have kernel doc
> as single source of truth and keep the ip man page to a minimum.

Agreed, and thanks for the detailed review. I've just posted v2 reworked
along these lines - the man page now defers to the kernel bonding
documentation for semantics, defaults and ranges rather than restating
them.

> The miimon entry in this very patch shows how that goes:
[...]
> 0 is right for balance-rr, active-backup, balance-xor and broadcast, but
> not for the other three. Since
>
>   c1f897ce186a ("bonding: set default miimon value for non-arp modes if
>                 not set")   [v4.18-rc7]

Good catch - that's exactly the kind of drift you describe, and I'd
have copied it into a third place. In v2 miimon (and every other option)
no longer states a default at all, so there's nothing to fall out of
sync.

> So for v2, I would keep the synopsis and the option list, [...] and cut
> the descriptions back to one line per option [...]
>
> Then one pointer after the synopsis covers all of it:
[...]

Done. I used your suggested pointer paragraph verbatim after the
synopsis, pointing to Documentation/networking/bonding.rst and the
kernel.org HTML docs.

Summary of changes in v2:
- Synopsis and option list unchanged (as you confirmed they're complete).
- Each option description cut to one line - what it does and which modes
  it applies to - with defaults and valid ranges left to the kernel.
- Added the pointer paragraph to the kernel bonding docs after the
  synopsis.
- Renders with no new groff warnings.

Thanks again,
Pranav
