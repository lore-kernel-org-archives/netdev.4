Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.80.4.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794967977;
	b=3b/OnRUNsDbPXXtQjsabE8b30xreg+j2gmxtHyD0ymWX8SEethj3O4+L6VL9OG6IEZTo
	 RVORRGQWetYwvkRTsZsSYWNbKpOstk+A1jb3cylDWiMm4yzeYMQOPXRxfgsiN1eyOZBFQ
	 Q2//wrY3FVslwDBLDnyuZWw57He4XlFxONDLIPhnFWuBmpjuvtCHGxW1EwmW26lkNyow/
	 +vp/LMFzzWUfvNwewcZnZma50vus6vCOOqDDMCeJdXXXeeqN8rBCMVbQv1EO9jIKyDPFv
	 HgDWxZXO84C3wt50r3NM6TaJSShxCLyijopsmiVF9r7WlitCbKdBUjkcll5hP0BGpaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794967977;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:Date:
	 From:To:Cc:Subject:Message-Id:In-Reply-To:References:X-Mailer:
	 Mime-Version:Content-Type:Content-Transfer-Encoding:X-Virus-Scanned:
	 X-Virus-Status;
	bh=owG1RKoUa0rmdjU2wKB+h6TD4I1LK9UkZwmt/Sf98vg=;
	b=cTCcehItC1FDMKTjoCO27stgHjT+7SpIgxNu0Jp1Mx+tPgTENvHky5exiB6Z0PmTS10O
	 NME5aYc39nGsxLLhqI9KuO/JqJlBGiB0uCzXkKJokPNnQDX3xKabHyNuKEjsCUNbVnO1U
	 JuGsELbLhpMMSPeO1XFJ/A8uxcXyoKLbh96+67ViRi91lvDm1NlHo/GE0hgU2j0dJAy98
	 sirQiIsp2rpWCynXBF7YRTOhherrOdUFyfZaNadPwkaELVwgrAxBHYKCpsA2DSNEOhd0+
	 QqT9SN+JkGZUwTqQNTHaGokL61EwX73f0UQ1smFd3LKd3O4ZznQx8Qx53nsqG1UBmEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uniroma2.it;
	spf=pass smtp.mailfrom=uniroma2.it;
	dkim=pass header.d=uniroma2.it header.i=@uniroma2.it header.a=ed25519-sha256 header.s=ed201904 header.b="Y/MaeVv/";
	dkim=pass header.d=uniroma2.it header.i=@uniroma2.it header.a=rsa-sha256 header.s=rsa201904 header.b="GP/Ey3g9";
	arc=none smtp.remote-ip=160.80.4.37
Received: from smtp.uniroma2.it (smtp.uniroma2.it [160.80.4.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 876D7606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:12:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 876D7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=uniroma2.it header.i=@uniroma2.it header.a=ed25519-sha256 header.s=ed201904 header.b=Y/MaeVv/;
	dkim=pass (2048-bit key, unprotected) header.d=uniroma2.it header.i=@uniroma2.it header.a=rsa-sha256 header.s=rsa201904 header.b=GP/Ey3g9
Received: from smtpauth-2019-1.uniroma2.it (smtpauth-2019-1.uniroma2.it [160.80.5.46])
	by smtp-2015.uniroma2.it (8.14.4/8.14.4/Debian-8) with ESMTP id 6AI2CD6c025097;
	Wed, 18 Nov 2026 03:12:18 +0100
Received: from lubuntu-18.04 (unknown [160.80.103.126])
	by smtpauth-2019-1.uniroma2.it (Postfix) with ESMTPSA id 9CF9E120065;
	Wed, 18 Nov 2026 03:12:09 +0100 (CET)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=uniroma2.it;
	s=ed201904; t=1794967930; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=owG1RKoUa0rmdjU2wKB+h6TD4I1LK9UkZwmt/Sf98vg=;
	b=Y/MaeVv/GrWs1YaDuHffPm4Ku3b6II8z90OkZX2Bjkke6eCMyuBqNBzsMrkD6H64+DPM6C
	o8hH30k9aP3ePGAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniroma2.it; s=rsa201904;
	t=1794967930; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=owG1RKoUa0rmdjU2wKB+h6TD4I1LK9UkZwmt/Sf98vg=;
	b=GP/Ey3g9fGTaogC5YI+sj4wu0LFTXclPDo7BcVjmLWIZsTS2GNT8+gBMrGbeSSBaqqcn8/
	SZFzUYIo3eB+iJT8DvauzpcPH7dZxlfd3yAghiJsgMn/S36TS5Jm6vW74V0ZfvYo046D63
	RGaASmtdkgXtiw/cdRQEn+RJjaDLA7SeHzZM9vLyfgizPm8kmgKn/qef4DM+WfzvbEJEvL
	YRVIixVsc0VvrDot9/vXsL32cAWAz7Nq5jMyiXllj6j0F/hoPQVnml/QJ7lo48Y2bSpqfI
	rnUSNivzZSn4VUrF8z0sLpjATlWOFEx3DouxSLYalD2g0elub8AGkIfaHi3r8Q==
Date: Wed, 18 Nov 2026 03:12:08 +0100
From: Andrea Mayer <andrea.mayer@uniroma2.it>
To: Justin Iurman <justin.iurman@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
        kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
        Stefano Salsano
 <stefano.salsano@uniroma2.it>,
        Hangbin Liu <hangbin.liu@linux.dev>,
        Andrea
 Mayer <andrea@common-net.org>,
        Andrea Mayer <andrea.mayer@uniroma2.it>
Subject: Re: [PATCH net 2/2] seg6: drop the packet if no outer source
 address is available
Message-Id: <20261118031208.38cbdb5e2c4183da17904095@uniroma2.it>
In-Reply-To: <20261115000047.14669-3-justin.iurman@gmail.com>
References: <20261115000047.14669-1-justin.iurman@gmail.com>
 <20261115000047.14669-3-justin.iurman@gmail.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.100.0 at smtp-2015
X-Virus-Status: Clean

On Sun, Nov 15, 2026 at 01:00:47AM +0100, Justin Iurman wrote:
> When no tunnel source is configured, set_tun_src() ignores the return
> value of ipv6_dev_get_saddr(). On failure, the source address of the
> freshly pushed outer header is never written, so the packet is sent
> with whatever stale bytes were in the skb headroom.
>
> Return the error from set_tun_src() and drop the packet; all callers
> of the encap functions already handle their errors.
>
> Fixes: 6c8702c60b88 ("ipv6: sr: add support for SRH encapsulation and injection with lwtunnels")
> Signed-off-by: Justin Iurman <justin.iurman@gmail.com>
> [snip]

Hi Justin,

the overall fix looks good. The Sashiko review makes a good point about
the BPF callers. They do not drop the packet, they return the error to
the program. If the program ignores it, the packet can still go out with
stale headroom bytes as the source address, and now a wrong payload_len
too.

It makes sense to select the source before skb_cow_head(), as the review
suggests. On failure the encap returns before touching the packet. The
source goes into a local address, then into the header where
set_tun_src() writes it today. That is before the HMAC push, since the
HMAC covers the source. For example, in __seg6_do_srh_encap():

	struct in6_addr saddr;
	...
	err = set_tun_src(net, dev, &osrh->segments[osrh->first_segment],
			  &saddr, route_tunsrc);
	if (unlikely(err))
		return err;

	err = skb_cow_head(skb, ...);
	...
	hdr->saddr = saddr;

seg6_do_srh_encap_red() has the same two call sites, the skip_srh path
and the slow path. Both would use the source resolved once at the top.

Also, a local sender now gets EADDRNOTAVAIL from sendto(), where before
the send succeeded. Might be worth a line in the commit message, with
the reproduction you already gave the bot.

WDYT?

Thanks,
Andrea
