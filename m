Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631467;
	b=WfIBLrT83498D2GWaK4h4sQR73YSHDdFzMqHL1dcNxN+hsBa7UwfVQY7aiC1F4USj4f8
	 NTuMPkz2HRFlzakXNpANbuBKv7SAaB7lyrQVnuEl3YFoay08zs85JfXee+j7BrhVIAaEO
	 qoerTqBPRYGvLZaOhY9/reRreMhWdIoCXGDxUNhubnL0joWLM2Iv9mUVALpl4UGrf1vZz
	 KJL/I684BWweJMUTaMmdWMqOCURbzL2pWMAVGI/oOWeDU/tEvkK5Ir81uKtCVCi2eQ2dD
	 dMXi9B/Hogt+IE9dmTGQnprhimZWdlcK7C+OnO+pN6WsIzzkG27Z8HWEH6raLyh1vYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:Mail-Followup-To:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=psXaIp3Nh1NYvXPifg51KMF8ZXrIK7h4nbMDzeSpDqk=;
	b=B74uRZJZ9wfb2KqnE8BMY8QNkF/aoln9pt0vzjAU4Nc7uzrO5QS2SElLOs+vv8rGibpr
	 lLgBLskjabTkejEW6t2tLvczaTHe5XSd+ma9FOL8JuSmND9SA5nt67H3IPgTz7RDOne87
	 qkz0ZFWseGQXDOncGtZJoZiCj3bzLA9GaODaUQ2GaS20JL+l/D0/ZSIljbxDGuu9t50Wl
	 lUQKPOoHZIJSJvQbi66vayT2/3WMN2F0TZvvECwGP/KaLh2Oxr1wG4kvKIMEo6RSOTeyC
	 vy7h+hB25QWkULqTtQAqIc3qhVk1aTipleUcG7iVpGe2fBnncbm7QRTyAcAMSm40nJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="iuOU/6o1";
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70195606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 18:31:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70195606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=iuOU/6o1
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b413997581so4803150a91.2
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 10:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795631466; x=1796236266; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=psXaIp3Nh1NYvXPifg51KMF8ZXrIK7h4nbMDzeSpDqk=;
        b=iuOU/6o1FuX7edBvOPgSborrvsi1AV6lTW56f3MrL5M3ciggBn7NAMlgNa88wa9V0h
         J2Y2J/+E6RkGUPUJU9gtxrUxsRbD+Wnf8wxUdHbhuC6IF58UhKws6Egbecx6RlQZrWRc
         sbwD7lV+ODmhLcZu3dshIVn5PBnQSddEGx0on5bPltu6CwR/+DAzjDvxHYc56xTscHSW
         0UD3kL2HkVHMUYXYsenkXbR7h/iPK7m40xNTWZ6q31opovxwEq6OPI0BGDYcq/RMhxJU
         abuWOSQEv/ECu0OuE/qdbLllXyEhJhw/wIovR33xiLGIailJ7jfGaHE/7mFFU0aA0siG
         lXZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795631466; x=1796236266;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=psXaIp3Nh1NYvXPifg51KMF8ZXrIK7h4nbMDzeSpDqk=;
        b=HQlhq6mMlKDZuDteMKuXxwLTJPgv/iRKi4iQYIjQtjPwn/ThuKQvZQQs+oruZ+Wvub
         oZYdFtV7NFgE6UaJSWUvhatax3YBRsC8/vgL5okEwILBMFbGZXn1M/1Sh6GSqzAGrG0n
         YfO/7pVqGUh0xoRDRMmys3TBQDz0RujIzJX2IehHI5dUIahbOYQJVp7OmyUdNJcfkqiC
         Rr/9q0dglTRBRvf7KvTu54Sq5qQzxQDV47T1ow7w+gfZOqkTp0qC7PUqHuEa63vgoKwk
         6Qh95hcSiGfg9RasLc+d3huly8hl/RQUtKRfqvsEcyRna7+M/34dOgsHlWkVta87jTXB
         odcQ==
X-Gm-Message-State: APuU4Z91+mRW+Ekw+xU+QggS/I3O/EvuybsmprbrcMhjDMQSnF61cu0A
	l/ODnCyC83e+ZO9oTzM062WFQiAPukqMqrXH3gspysaMHlbr5iKTXNglQedazAheP8k=
X-Gm-Gg: AZFdTZcwXRY8PIwIfw9Wry0SIiigXmy2VJ++lgHoyvbqM++yHLgUauO/0emJh1BxRUJ
	h0CpFTEyhtv4EvIfo/5ug4v0cPuJL6JBP3JgKrIClfRwgkIDybGwkrBQW27KUOO/Aw2WT9XGFxg
	fXxsunyactx4VVVvfFuhIn31ELZ+Zk1BcrXYDfmX94Zj3xNdPtBALxwBbA/5A7jEpTIy+JoyuaA
	hgYn31rmzZdgt5JdBTvx3+BmYe4Kpe1GMVaDlMe4VNZAyY8CSTwOwRsYllE/42HqMfa9A83PI0m
	SV+8x4q8BPwtpNwQ6Em1nZd07C/URz73ZG0lQF23R2UpRVFC49/lU+5+Xpm9vx4DAWQROfdbNtO
	znNenl3XkKfvQhW+lCYurIj6Qlvb6m19o0aq0zF6hGAKy26Lgm49FRgKZIHoPYUKGCz2R8aR0k4
	NL+nG5FqyH3LS7m697pMsK2aUyFUp9Ipng3ML/na+vtvvfgpruk4L03HIH6sVZR8ObtiqQrr6Sx
	2KE+XzTXeKtNVrOfa5DVk8t0rRvmp7V7yWKiCOk8DggLC0HKCkpbOOak3fldoVXHv3Ss+fksYXF
	m11LSLGHYxL6h+X293xiGqLwntnvV9F4PhrJf6tGiCI0T0VQocyhl5bbPr7rpJhR
X-Received: by 2002:a17:90b:3f0f:b0:3b4:393:452a with SMTP id 98e67ed59e1d1-3b41c9120c3mr19229519a91.23.1795631465833;
        Wed, 25 Nov 2026 10:31:05 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:4e::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40f4312dfsm30399611a91.3.2026.11.25.10.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:31:05 -0800 (PST)
Date: Wed, 25 Nov 2026 10:31:04 -0800
From: Joe Damato <joe@dama.to>
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	horms@kernel.org, linux-kernel@vger.kernel.org,
	daniel.machon@microchip.com, mbloch@nvidia.com
Subject: Re: [PATCH net-next v3 0/5] net/mlx4: TX helpers and deferred
 doorbell fix
Message-ID: <awcpaDKczx96P/oB@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, netdev-bot+sinfo@kernel.org,
	netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	horms@kernel.org, linux-kernel@vger.kernel.org,
	daniel.machon@microchip.com, mbloch@nvidia.com
References: <20261125180021.1804204-1-joe@dama.to>
 <179562982857.3294.6026464051217294907@kernel.org>
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
In-Reply-To: <179562982857.3294.6026464051217294907@kernel.org>

On Wed, Nov 25, 2026 at 06:03:48PM +0000, netdev-bot+sinfo@kernel.org wrote:
> Hi!
> 
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
> 
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.

I mentioned it in the cover letter, but I've been testing this code with SW
USO changes on top of it on an mlx4 device, specifically a connectX 3 device.
