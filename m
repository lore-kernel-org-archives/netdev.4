Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795653252;
	b=fNclhTkMVIipTU1V5VN+ia0y30msmQgNOPfBpoLUm1WLeb5KuVkHgeADQZcZyC0zRkjh
	 ZMIDYcPLJHi18yN3yiPTCGHjZlGwSNk4+gMKVGjX2UrBCrOOhca3XrgscvOFvpOZ0wXNs
	 lQ4bzBUDrl6OsmcZ11TD1drXAyJwOLSJ7Oli7LPBFG2VHKMH5Dw9tWq1F7WsIBr0DIQIf
	 seBtikO2L/a3JF7q5BtbSqMxvfIufw7aiQvXiwhXGVcGTyrf+0jQjCQilQRBiYd3pf0Ws
	 npMTXt3rbWj5HLIE93ViqcN+LbgZbq1isGyTxNNbYZ0S2mO/Go8h1agu+cRREJMp2hQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795653252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=d6I9qfDDhxE3qwmEK7cNTIsxnZEM41yNcM0rvHlRyTY=;
	b=DMAv6b9M7P9AIHarNdItxauSLy/bYEznq03UywVCOySpm6ISIzzOwPiBOasEG1xYNwGF
	 X72UE3vxuJDSxTOfM2WNoXBt2EOsLffVYNvIFY03yZgmJ+IC4MnmVaTCUlLee2XEupO4j
	 VF/WlHlytG5r0x/qNKP5n8I+pfrUPvcAxnIwQSaUMkrWhtWmcitXuKjlksmwjKmwX3tX+
	 C9YP580frgzR1VjKoRooGsHTxtDodDAHdHW5dBGsw/KUlQmwwpHoW1/n7w4HoPN+QQq7i
	 KJqIBl/uLBAfx9qAe8+xf6LSG6oBXAGiwpU92hWpr16a2cHFa1ahGvBxfWRG2/TFo6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BFK3p5jX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E313606A31E
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 00:34:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E313606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BFK3p5jX
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2efe591a1f6so22088565ad.2
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 16:34:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795653251; cv=none;
        d=google.com; s=arc-20260327;
        b=od4KxCQQ6VQo7npaLsbpZLMD82ECXHl51tWUZyM9q2fEbU0Ttvw281hgu+WDzwYBRt
         9TZUJp55kDpVKvt0Aqq0rdUi0i3M4TgQtqIgn7aHHRGNdzJcJe5s0BLMagzVCouf0tF1
         Qzlqp6NTS/QHcS3ZmUTjhRg9WTLITRry+gWr4vUB2IcenAVU4Im+qU8zWyZeXO6dLgEB
         s0BHmIpIa4d4x3MG71Ps1oj3+8HysgalLTKB/o23Px7rECN0W7p8GqsOjx8UvHgrSEMI
         D/y8brCQ1auwT+MV1omyjdGd30EMWCk+Lt3//dI+f//RRGGSJMhnr1aLU8hw/c7Bca0P
         G7MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=d6I9qfDDhxE3qwmEK7cNTIsxnZEM41yNcM0rvHlRyTY=;
        fh=AxTDussfMV3VgfbLaz7vRWRV467bxUVVt7CjVclUvSA=;
        b=HKtEWcDr4o+KtNQQpdDbpKV/03fPyNNv8ktVZU1o/mvzBUlh//5cVb3ieSfh5hY1bG
         WFhqzEbGArtTiUWH92VIkDFg3mfnFkTHq0R3FWf5+n22E5SAatBSb+LkopldaHdlMtUU
         S2EfXlvRy7JQvelaQqBnZ365spLBPR/jbCeiK77k537N58M9oZaf5S1EQJavR+65uKwT
         JZz7gAehl2+pdjjNBE5AD2etH8hTc1a0zzitDO0w04gTjvkg4ynt5OHv312Q9NgWbpOd
         qzCZ0FBJUe6QKopgdZ4nF04LgfyDSUT2hg9SZ4x1ZiNpc8b6Vbj9kljcbKuk/Kd+R6qq
         B0KA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795653251; x=1796258051; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d6I9qfDDhxE3qwmEK7cNTIsxnZEM41yNcM0rvHlRyTY=;
        b=BFK3p5jXUv6YeG8nVgnndSuyNzUBzepo47YrdeRrPgSYT/bpdp/D9Kz3pOOIyhvZbq
         7wUD9sxhWwX3O6NBYldGrSkH2l+wdvnF0erXnBbqC85Bin4mSccI0ozZo6NyBuL0xaXL
         T8bwjcQgSBY/Tox8DMELTTRWN7Vq2Y57Ecz1xlb94lZqtJyGHw3PAwCbaIWGILvAYScQ
         tXzF5oPXN6dxOO5Y8DyVHL3ZMtOKIjFdlq6EfH8naOh3MGyFtbDpIRryUyJBvz2bltv7
         RjJQVlebqdnba4qGpUaWEdjQ/VoGtSuksTzBXHFpOvmyOzA36BB+tiJQ/TYEuIOiTy9a
         e1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795653251; x=1796258051;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d6I9qfDDhxE3qwmEK7cNTIsxnZEM41yNcM0rvHlRyTY=;
        b=SQmX2ao5J7st6zSBIstTD0F2WXf0+9djeKjslc6P+VuY4GvksBr+aKMOdHW8+75bOH
         Mfw9wb/hpO7fWi+yo5fMzv4QYg9Mo85s5Mz6Ak65fXQN4+U60RqmSKtZMFF8tuYtcn5C
         oTx6n0fEyLBFqs5XH6iurFQ6a1P2KFXT9KStiZp6qguq6SRrmNXI+md7ic50nAOW7V14
         aSXOa9zmlSU/3w3bY6Y4FihBbyO6j3Z3XcfnY/YGmUeDU9cMEYUcpbLtAgbI/Zx4peih
         8Ur58TNq+KjFDQ69xcUp3xv7XaSOTZb7o8zcfzJ9JqCMjBUrhzIiL/+N7rN9519Jo5PZ
         1ytw==
X-Gm-Message-State: APuU4Z/8Y2uoCsCpbJT+PSq6Ye0TJibGPESqt+spMVHrKTNXoX279TBs
	wXnKL9COJMjpGDOaPbj3gFZtfCpNX6dmuvBETpUIbTKEqvTy5HpUgMNJ6/X+TInmxMll/3VC1s5
	XNxn2wKIMHaAa+zNCtydyqtqPLBI9zr0=
X-Gm-Gg: AZFdTZcfLzlIvT1vEk3Oxqaa5h/L7X7dFxs9aI5bFtsr5myDxl92csD/P+5y/OIDsoB
	Y9TJgqlAglutEDoN5oA3r1k3WEm7WpwHgaghLip5idZ70YE1tZpx7v60IbPBF5e6p1VtzGQi6Pz
	4VykJZf5MX1ew244HM5tZ+YSa/vsheyyG3e8nRC+u9FLTyTpIyWNLeWO2A9X1QbMeoO51sBNCmb
	5wCHnzyC5cm7vRgMcoi9Bp4oT6PbPEU0Fn/y5AHBKWLE7NJY0Opbognui04pvrI3Nwh9y7r9ExR
	CthCRu0FJfBbcQUwoFpPfXUx59ZyuUZIgjAqnQIcIlm0il+TsIkVgXx7+5Oqom5W+tXyKtZFobJ
	LvfYMTU9S09ZNqkKzcWxOKpFVaukb0/MVk5Lfkhh+gOdLL5UR+jXTm/mbzGbjipuh9MoKx6a+TP
	0grAAqOxwpuzyIO7RZQqVHTAx92kB4EA==
X-Received: by 2002:a17:903:2f87:b0:2ef:e285:7085 with SMTP id
 d9443c01a7336-2f03f1b1946mr190849675ad.44.1795653250879; Wed, 25 Nov 2026
 16:34:10 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAAHj5qjM7BoGKD35gVCn_XCf6ec-LKq7-5_1YMewOYfskyATjQ@mail.gmail.com>
 <179565312892.3294.7644425039287858356@kernel.org>
In-Reply-To: <179565312892.3294.7644425039287858356@kernel.org>
From: Tom <tomasbortoli@gmail.com>
Date: Thu, 26 Nov 2026 01:33:59 +0100
X-Gm-Features: Aa3M54qD5FyaWdtuVokZHy_lZB3X7QDUh9rblmh5PsTmuj8sNj9upDDnBunSuGA
Message-ID: <CAAHj5qirck7vmD3ugQXA-TgaYp_Az4RbiRDw9ogqeYDy=+NJ+g@mail.gmail.com>
Subject: Re: [PATCH net] udp: don't apply socketless ICMP PMTU/redirect
 updates on end hosts
To: netdev-bot+sinfo@kernel.org
Cc: netdev <netdev@vger.kernel.org>, David Miller <davem@davemloft.net>, dsahern@kernel.org, 
	eric.dumazet@gmail.com, kuba@kernel.org, willemdebruijn.kernel@gmail.com, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

manual code inspection + runtime validated

Il giorno gio 26 nov 2026 alle ore 01:32 <netdev-bot+sinfo@kernel.org>
ha scritto:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
>
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> --
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
