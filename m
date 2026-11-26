Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795698953;
	b=Gs77nQoDGHBniH2wmPiokXxpEGNDuP5MQw8flTC4rvEn9YPbsB+fsBRUbyRxrFF2SSM8
	 TYedpUQYM6TgwU4dz1xYRf25u7Fde1rx7+OFfxY8mmoY3npKXG3OU3b+jpkkCf4ANq4mI
	 gfCCFMMjBKNhkeI7/9O+4+t8uw66bEavDvS84WCjbR0Ir4N/9+qNtpaMDeCODOy3mFHYk
	 KmsRIcuXKk2kARz6Hy946CZEGAkn6kMyNJriCPr5EtocwC6XTqUixv4VaMRJhdGwr1CPp
	 viHA3VC7E/63eic1EukszgO+20Ou6tvHm132gs2hY4nkDbH+pndTq0+8EJtL9QQovDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795698953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=vuErX9b/1HqZZWQiS2aiX9fKXKZfo4KQ8+WC7eQ3Pqw=;
	b=g2PfqQC8FpwXHXMkRK5giZMEFX+yxovtgSX9StohO6bBA4k97ADTvHbConTKib0wcWeM
	 kfBK3jhwjAnjibXyhVrD+wSovwALqkHOusgzLsetuGfYfhLDgfWBxvdzE6EcYx1wXJ6a+
	 eb8bk03DUv73QQERWJarc0+xfp5I3RjnUeoYKiKKKeL1qr4MYrFezD1WgcPk23Dtjmuaq
	 nNb+wVyKdnnYqJ/AqzCmihIMoS/gyTPpJU+IF1KLMM4O4DDivHgoA6XSHRA9FUYAQ7pAT
	 ErhT2i6DWPA57j6gM3OPNxUWnAnT8teAnPxciGzM68WSQLKyr1H9RVmmXL8QmVu4ZBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VgS0MqS+;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E66606A31C
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 13:15:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07E66606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VgS0MqS+
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b43d30822fso3738940a91.3
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 05:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795698952; x=1796303752; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vuErX9b/1HqZZWQiS2aiX9fKXKZfo4KQ8+WC7eQ3Pqw=;
        b=VgS0MqS+cYIhfwHs8IXM1FVncD0caK93zZNu/oQUyDhQOhTAY5i7Y05HoJEGRgDzkJ
         DoDlZ/k9sBYVEbo4jLey4ykjoB77MWT0dPYa3sD/U6HqVgNIHadtT7tu7Q88b7yDeqbT
         nMoQc5/A+DUyUbLtaKkbkeAY9Em9tWQfvs7UeqLGHNNrlcILSZAetaXUnYKLf3pqqqfF
         0FFQrq8bJyCSMKrgDzdoJtCgvyvT4nRnn3HYQxwy7+ygcmhgRPXToJoEoWdMqLQPxpYP
         6qv8uBLt+Uw7hC7dKTcaeY571p8f0DBgNu45Aqcru6n41Fg4M2Wckv5/Llgz0bFp/k52
         kNCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795698952; x=1796303752;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vuErX9b/1HqZZWQiS2aiX9fKXKZfo4KQ8+WC7eQ3Pqw=;
        b=LzfzZLHWdvZVpk2SFPrtAs+i+mI047A75kTtG05JJUo/ODqI4136hsVvZgb/msy6V1
         iRVwxW5X7Uriw+k0kxdITCvkWfqInetQAy8LRrIJCusS2hDIgqeDd5t4JpfJi7fkAs3W
         FKaK23pq5ND6j38/2uy2dcvWGEUdA8sZwGLIWtReeUZJkQlTC0llAGs19conOqaA9PYa
         XC35mIKYvLVXBuAT8alrvWjjRjFqfyn06X7GpyC9GafckizTuBWcP+EpJ98KfE/GyhtT
         MqfWysbPm+p21hJmZFGuP1vQZFAtkQY1kkl+aoUsrSV+M6RF0aqxmMcCgTscEtZGVezy
         2cog==
X-Gm-Message-State: APuU4Z9h1fUSZEpj+LpE934lsIakm+mJha7HvmpHIrQhHsVm9zxK6TKG
	er79tzNi0a8mSmNxtOha+5LCkQaQf+0e1H5yE1TXG+3P2Z7UqCiz7TG8
X-Gm-Gg: AZFdTZdNvbV2brgQ4dUpdpFjjqv7ZUww6k9R3Cvwp5/x19yEAFAgU4LK7paednZTDb9
	+wbwidCd0u4gSEo8gky287y5LOukMUOL2n3IDVKSFl169u9Lk6o3MZFs6DAdOzNemmvt3teM6lS
	0ALBB+/QnF/xNt8PNrvu7B4YDorm7CX4Iqh2yrisSilBaJEJ4xMzNQTz+UyTtXmZbYdiISWqme1
	G87042n6+BuyH2BQmRAF5TdZ0G8OjyfqkMzFknxWhq3FwO2UYbAf1kBcsmwrf4Yt1OvnG/4LG3x
	WBQPQKlOutERiTX3R1295htZY3WHrJ+z1d626o/o31LjuIGDyteCJC8kH0QOr+Y36/ikezBCRCk
	EMDRXQNrVQRZRo1S4vPZs+AbjlJV6BVH4y6BIHLfYCGVGrU7sZGKGAERcBNZzmZQjA3sjyHGDZF
	JuldN+jT7RiW5pDEPS/GrzNaKOsrgOrRpB2XkwISRywp+d9kBWS2h3RbSePLt+VfiOqwB8DiFoK
	bSJ7P4LDyEeuuPZlyHhDPNpK6CGceJMvTLnaMSlKCR7eAaTXFIFBUdDX7NnIy5R22yxzILnB+bX
	DjChjs6g9PbqMDHovldPKmreWBmIl0ATKnptJXMYilnSCMWwyhO5gA==
X-Received: by 2002:a17:90b:390c:b0:3a7:9e3d:b3 with SMTP id 98e67ed59e1d1-3b41c9beafamr18976263a91.66.1795698952271;
        Thu, 26 Nov 2026 05:15:52 -0800 (PST)
Received: from srsys1 ([147.46.174.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4afeaaa84sm17021676a91.10.2026.11.26.05.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 05:15:51 -0800 (PST)
Date: Thu, 26 Nov 2026 13:15:45 +0000
From: Sechang Lim <rhkrqnwk98@gmail.com>
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org, davem@davemloft.net,
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
	willemb@google.com, horms@kernel.org, ast@kernel.org,
	daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
	sdf@fomichev.me, tehnerd@tehnerd.com
Subject: Re: [PATCH net] net: xdp: Fix skb->tail after bpf_xdp_adjust_tail()
 in generic mode
Message-ID: <awgxAaMpICtLvDcJ@srsys1>
References: <20261126125558.2032158-1-rhkrqnwk98@gmail.com>
 <179569793062.3294.6946658046125535159@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <179569793062.3294.6946658046125535159@kernel.org>

On Thu, Nov 26, 2026 at 12:58:50PM +0000, netdev-bot+sinfo@kernel.org wrote:
>Hi!
>
>This is an automated message. This series looks like a fix, but its
>commit messages seem to be missing some information:
>
> - How the issue was discovered, e.g. hit in production, hit during
>   development, syzbot report, manual code inspection, LLM or static
>   analysis tool scan.
>
>Please do not repost the series just to address the above. Instead,
>reply to this email with the missing information, so that reviewers
>can take it into account.
>
>*IMPORTANT*: If you do repost (for other reasons) - please include
>the relevant info in the cover letter or commit messages.

Found with a custom fuzzer. I'll add that to the commit message
if there is a v2.

Thanks.
sechang

>-- 
>The evaluation is done by an LLM so it may be wrong, if you think
>that is the case please reply and explain.
