Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795647288;
	b=WcC+tgwBC2ybj3nFXHq0t6MaYoOD3eQ758awyChoNRLw8f9XVtEQiq9jZ2VELztwjCap
	 8hu+s/VWMzjc3Cov1vsjy/APN9Dt3r9LHtHfWRduGZz+65FLyOlPyjhn1y/Y5X94/z1rJ
	 t2S19mG9EA/cp0ZHiSMvVO/i6+Un6iWxJ7y9rugTelIYOulTXocTY6u0QcTbXz41ImCR0
	 xLN7yI3AuUIXCXvGeUogXovIP2Ww53Ljm/EMU7xnv2YDg3ZMmv/X7j1ndcAzwYl66grnt
	 2KdiN8LoqvOzsuGXv9N92KIwQpVUgLxA++SvfMwaWxwHBuJJWV6GnKXkwg49PNcVo4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795647288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=CBZTFfusOkG13bxnOAC83IF5FjAHamXHCLZZHpXQxUg=;
	b=PjhV9JjM6E3WLNvif5SP3sP8zsLPj7bHNecLTPWMSg528/1LLq7J6atqmFBXcuRiQysZ
	 CVwUKW1MCEetGGWZTBlkj/6D5Hg/mQ0R3xHuzb04lcMelO6LSiCrv2P4zIZ2xPHM5ulLJ
	 2HYM8SCzVD9IRRSJybvJrWNdjWlmnBGDhlCnNX64KJyE1dFha7oFa9VT8RqSfnplbJ/IM
	 6abWrHpl7MO8c80MUko57IolUIAy5QS89Ud2YV15Je0ap/kXg9/U1DDP9XHPxVyqt4/OO
	 4v61fm819YcrRH523xoepQg9OWElQYCBQ4Vwc9pv7NmoxvwWJwuZn5mA/JML9lBqW/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="fZfzlZ/G";
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15C5606A683
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 22:54:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C15C5606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fZfzlZ/G
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b4a93d0814so2080545a91.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 14:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1795647287; x=1796252087; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CBZTFfusOkG13bxnOAC83IF5FjAHamXHCLZZHpXQxUg=;
        b=fZfzlZ/GhS3uzVj+VcrQoJc5cxkOh/D516vjQXyeGaK0gTDeBpiQlTDeEJtczeL3i5
         YCTcfY+Ggr0G3On6bpqwTv9K3n6QcNPuGCcEcYzdLEQT+FUZCmckYef86d/SDAwoJ/t6
         6dxNxyu2Pi2ETrQWGZ42TeEAHDBBdxoEi+juhgqrBNIWbf5XtgFfhtlergdE0kU0g5qX
         Fo6Js7aAZD4u2fTm4A1hv34azcMvbhm+wWOeFeuoWPxM8JqprrmeMhjKYopcLaMkS/ey
         bRrWCeJvf828KoFS9ArtuZvi8+48QI2yRf+HU4rr7Nq2aYgPDoaxk6u/G1NdOZiDTq+7
         GecA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795647287; x=1796252087;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CBZTFfusOkG13bxnOAC83IF5FjAHamXHCLZZHpXQxUg=;
        b=ZnNpaAbOzAxI6NDy2jQ12MfaxZyJknb0v9Z8J8U4mf8+DrPJxxUhp+6NqWMRuLg5Wq
         u11RkpD1fzIUBOMvEKnA2qql8Z2IlSnil01IrF+5yUFdWswE9qa380oKKZNMP0+NMa9z
         Jk6awNZcZzNlOVWgXsJ5cdG3cJDiCllyoW15wZxaMT/7KbjvfXzEZ0bw4RheXLIeeEJp
         YX5GmSgJyDrAz5NmIVk11CbLu3IdOLIxGzW02HptPlN+ipxFbYIO2peF37i36fRmyfzT
         Z+iJW1EmRDrekV6cHXG1MJmwZUL9BvYva4NMmSeNBDvhWfCmzvoUxNoGnz45tV36i1vz
         EBHA==
X-Gm-Message-State: APuU4Z+lrGf+lLq3ZtwMA5pjkndzwePTJrvFahMKy+CB/xnNnuc7kEfy
	3Qzt2dMarDnLgb7kcBnt1M8mG2waWDD2v/N1zwPOzPyMEqQKjktCiYi1ZwIZgmVuVpY=
X-Gm-Gg: AZFdTZeDFuTmUQdwQ2DE25JZnEFgisaWKobz/fWeUD79k6S9y+gHn8sY8vfpGh75QvP
	uc/1QV13hvKS/q5BvZJmpiT321JisKDLXwxFiwwjTevobGWLjcwwdmWVcHjKodZb1i2uRLOK45L
	8pBKnBbMHhtCboCXcpr+wixnJknvQPsR9hovI0OmmfTDYO7Vc1w3RipwqicX4nGpX7T6BpdEDoj
	PBsaHKqDqlzWwp5R9dGdrZncFSbpmpXRuRMcRWBac15JqAuzdIsICGR5K+4VFD+FBQUjfcCDs8Z
	c8jvu2RjAuLW7V+mY3ZD04Gd/tGybpNY6JkKRgQN9isOVco10tdnZjFKdw9WX5m3Wvz8rLHD6iP
	5/87j7duSMIqbRlfNLazE0LqzcBOwXo1rplqKIgOYg9FfbbXH0GlXeyKG0x6uOYwrnK4+NOVZ0m
	ydczFFtrzpsAJ+IA355YSYnqsYOwa+njgTdyG3+PcfEMUkpder5mVRFtKjf9sOCQnk9jpw1KCgw
	x3CPhnDw8+cURMv5Pee+MdmQ4PazAVl570BAWAwzKGZBqTH6gZiNDCzrWNNvsvumOZYhfojMkB8
	do/g+xuBv42dbl7hnaPNzJYjKqmiitnafEg1KFwyYuAvYI30hoZARf8Sm6dJpPIZPhnAlXG+Wh9
	/zEBzuxii7mm1Cs9l
X-Received: by 2002:a17:90b:4b05:b0:3a0:516d:9f88 with SMTP id 98e67ed59e1d1-3b41c911c9emr17360324a91.26.1795647286965;
        Wed, 25 Nov 2026 14:54:46 -0800 (PST)
Received: from phoenix.local (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40f4312dfsm31157205a91.3.2026.11.25.14.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 14:54:46 -0800 (PST)
Date: Wed, 25 Nov 2026 14:54:45 -0800
From: Stephen Hemminger <stephen@networkplumber.org>
To: Omar Ramadan <omar@blockcast.net>
Cc: netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>
Subject: Re: [PATCH iproute2-next] iplink: amt: support an IPv6 outer
 transport
Message-ID: <20261125145445.11835626@phoenix.local>
In-Reply-To: <20261125170100.3054010-iproute2-omar@blockcast.net>
References: <20261125170100.3054010-iproute2-omar@blockcast.net>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 25 Nov 2026 19:14:47 +0000
Omar Ramadan <omar@blockcast.net> wrote:

> +	if (tb[IFLA_AMT_LOCAL_IP6]) {
> +		const void *addr = RTA_DATA(tb[IFLA_AMT_LOCAL_IP6]);
> +
> +		print_string(PRINT_ANY, "local", "local %s ",
> +			     format_host(AF_INET6, 16, addr));
> +	}

Should be something like:
		print_string(PRINT_FP, NULL, "%s", "local ");
		print_color_string(PRINT_ANY, "local", "%s", format_host_r(AF_INET6, 16, addr, b1, sizeof(b1));

key point:
	color output
	only for address not the "local "
	prefer format_host_r on new code 

See ip/ip6tunnel.c for examples

