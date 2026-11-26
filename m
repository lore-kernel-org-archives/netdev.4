Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688078;
	b=ppiSGKmFxJnadChNg7ZzRiRkpSU4qXKTmGe6vrxExjE3sptH9ZgY2vw/ZSEbYBizvDaj
	 8TDnLUbZmzuPJqpnzsjNNY7IfMdgDMidL6RllrPJcN8A8AlfWc+eioJveOP60nAyIcAJA
	 vrdWiXwib9BOSRHoKEHseEBrt8ELpXUdPK6gffvsKV8lUlUNhv96drDvr9LGqHEkHNdEz
	 fcKFr5zdXMLFtQW2T5aMWylqqsQsjaXDfyLwRC3xPphX5atsqq9LoCW6LSjV3gTdeHgl7
	 3DWOIHba/RQb6TM1g93kueqU1AG4u8pwSsA+47z5/2wcymH3YJcpFxZ15ik8/kGmuZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688078;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=BnEINIidcy7TeGrgKBkYjEF8byD48m59WTwJN6efYCU=;
	b=tfzG/Dt3BCyUspI812c2hWPXoB/pNhoZD2NtRGcHnO7wM7KbHY488qwnzjG60f098V43
	 KqsB7YU0+GdIncdbXH6nAmBkE0FS83q/mF422TgUXp4c+NF7zGx2qnlCYlgHRKWVrzQXa
	 R6k2FyUCm2TrsnOtlXaO6AvUzJfvKLlkp2kBxkNKhcr1VgjWzQTfXjjslJEciC3czkihC
	 heyR7RSgIYyMOpnDks0qrODItC/SPUlO+MRT7cxoHnM8xedMestmcx0NgHXD4h7b+IcGo
	 1q9vWSm7XdCJYLw9KH362NMZfnb/Cbh2f/5l79HVgTPf8s3mLjOITxYkE4Uj+CxeisA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QfhvVOBA;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Novt99Iv;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E8C606A682
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 10:14:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46E8C606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QfhvVOBA;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Novt99Iv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795688077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BnEINIidcy7TeGrgKBkYjEF8byD48m59WTwJN6efYCU=;
	b=QfhvVOBA1Jh5+GzeK/PWLIsk/3l4Hm1FRzShQ0yTqSUFKtfC3ULVr/pzzn3JV7fLOIXdJX
	0vmc38r6FCLGhosgWNclLI2fNSmNFmnkmOqw31D5vcGb4wuSP5fK8GgNkBHagLN9WE2X0H
	29sJQy15kbXHisMGOnRLc6cZu0Vx1Eg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-656--AxGBYGfMLS3YPgmo_Htgg-1; Thu, 26 Nov 2026 10:14:35 +0000
X-MC-Unique: -AxGBYGfMLS3YPgmo_Htgg-1
X-Mimecast-MFC-AGG-ID: -AxGBYGfMLS3YPgmo_Htgg_1795688075
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a204f135ffso35539005e9.1
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 02:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795688074; x=1796292874; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BnEINIidcy7TeGrgKBkYjEF8byD48m59WTwJN6efYCU=;
        b=Novt99IvoJHBJ/nZbRBzAfBcTol0OkkVsYep/cKsDHWzuCmfRlBwTGAwNzvzTwvikC
         YApTr97ucTzYvzijLm1iSOdclGJ+wewkvaO6tyqb9QvQElDnBHsTbE2XRmb08nib9IS+
         fPYQr18Oxc128/QnVzb8nD/sCMldgYlWBbpamtajFaiZ+cX6HDC4z6pKrk1G2gFwXr4V
         ubbLmJp04FG1V5+nmDmvPcaUD7EghWcpfm9hYqBqgVul0l1Fosfx6FyBsztlzNCGrkFi
         AwQol+biuxYtul+APnDx7r1d5FxyBKErYWbEvZEzKof/CmmjPCnqvpZioPhH1dyPDmB4
         gsHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795688074; x=1796292874;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BnEINIidcy7TeGrgKBkYjEF8byD48m59WTwJN6efYCU=;
        b=SvZxWgkeiXS4BDjsRKBIumkNbC8mKBoTKjufn5XtVy4F9c8ZpyjBXxJ34QZyB8mIYL
         MQP93vU4kLD5wn5O5ZWNpuvQUtDlC4YuXs/i3mQ2lgHlQzOiZua8KwHJ276+jTOrTv3z
         OjT/cQJ1THbPWa/et0LKDm4i11eZ9r0CbD8BIK++JIJHiXP3MVX4sscfXI4COjOf8aF1
         etn1pJUIswpEVulLPjUNZQIoycHehg6Ot0c6xs10gIUoPm3gaOPUc7ql7Mn1dTSzYD9j
         bLftWyrpKQ8Gc024MQgNAOjyLFRVbaSVg6WZBR2ZU+ZnhClzpdLpG+uC2gjaNhfZcJOu
         erBw==
X-Gm-Message-State: APuU4Z/bW+oc1hdKGAn5vKs1+7Y5h1l08f93kWIZnpQuwDjb8U1tWNxo
	aEISjjCPHm4rmN9n1nl+kBDTgGg3/MB+zfGdon5TOWQdqzt6P9llvCYpbyTI5Bq/GQPx02giPbd
	5Izwg/hp0TcpF2igCf6UQWCzbwcAmiFx/1JHqdNPkjkYE+evvylWtgawswg==
X-Gm-Gg: AZFdTZcBnOgY+0WdLEiKij/BrGf0tnE+DV0k6Bjrhkf+3eCr80PM4cqTp4Wr543/8+W
	mt6wKhKG/voccGWLMeHx0o/NJ0WV9Isz6nLMS91aPYjefZGDw+61tjKVTzZ6aZPB8AwSjyjf0Kh
	O8Mfv2H8WymbwL3qnsD1j50O9FVvmyg5+9Jivjb5Z35jiYFM2PRCqigFh6ZIhyTmXbmvpEWHBjt
	fxgeYpZvNi/ii7g+p6bM28RaGl2gLMbhELiO3qO0iiTEcjHnO6Vb9fYL3X/Y409jSwHLs3XLGCL
	lYaDxofgcOU7T1LIaLNqUuMDBe8rH7km8Yf8P983eekyMfShoXNXFnDcAADVtqMSO5hfPN9p1TY
	Mj2ZGczCj7KLNPIM/X0dE/nXW3At1goTyl6/uRVYfp16jajINvCmFPA==
X-Received: by 2002:a05:600c:1d04:b0:4bb:685e:cc42 with SMTP id 5b1f17b1804b1-4bb88817e4emr429734025e9.18.1795688074522;
        Thu, 26 Nov 2026 02:14:34 -0800 (PST)
X-Received: by 2002:a05:600c:1d04:b0:4bb:685e:cc42 with SMTP id 5b1f17b1804b1-4bb88817e4emr429733645e9.18.1795688074082;
        Thu, 26 Nov 2026 02:14:34 -0800 (PST)
Received: from sgarzare-redhat ([80.116.143.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf680fsm45686158f8f.14.2026.11.26.02.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:14:32 -0800 (PST)
Date: Thu, 26 Nov 2026 11:14:26 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jia Jia <physicalmtea@gmail.com>
Cc: netdev@vger.kernel.org, stefanha@redhat.com, bobbyeshleman@gmail.com, 
	mst@redhat.com, jasowangio@gmail.com, eperezma@redhat.com, 
	xuanzhuo@linux.alibaba.com, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, kvm@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v5 4/5] vsock/virtio: coalesce native RX
 write-space notifications
Message-ID: <awgGJECGxVi-40Tq@sgarzare-redhat>
References: <20261103041134.33310-1-physicalmtea@gmail.com>
 <20261103041134.33310-5-physicalmtea@gmail.com>
 <auxHe77Kv3tS4hjJ@sgarzare-redhat>
 <CAJwVaMK6UpxOmCbuzGK15h+DhN5H6cj6cy-=gCHtSxoVbLfzwA@mail.gmail.com>
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
In-Reply-To: <CAJwVaMK6UpxOmCbuzGK15h+DhN5H6cj6cy-=gCHtSxoVbLfzwA@mail.gmail.com>

On Fri, Nov 06, 2026 at 08:49:17PM +0800, Jia Jia wrote:
> >
> > On Tue, Nov 03, 2026 at 12:11:33PM +0800, Jia Jia wrote:
> > >Each received packet can update peer credit and call sk_write_space(). A
> > >writer cannot consume that credit while the virtio RX worker retains the
> > >socket lock, so repeated native write-space notifications in one RX batch
> > >are unnecessary.
> > >
> > >This patch coalesces write-space notifications on the native AF_VSOCK path;
> > >data-ready remains per-packet here.
> > >
> > >The batching patch establishes batch ownership before its first packet.
> > >This lets this patch record a pending notification for that packet and
> > >flush it even if the packet immediately ends the batch. Deliver it while
> > >holding the socket lock to preserve the callback context of the existing
> > >receive path. A following patch changes that timing together with
> > >data-ready handling.
> >
> > Can you report performance data related to this patch also here?
> >
> > IIUC this is not giving a lot of advantage, so my question is if this
> > more complexity really add a value for us.
> >
> 
> Sure. The performance tests currently cover patches 4 and 5 together,
> so I will include those results here.
> 
> They do not add another broad throughput improvement. I kept the
> combined notification change because of the cycles/byte results.
> 
> With P1-P3 only, against baseline:
> 
>   Buffer size  baseline cycles/B  PATCH cycles/B  cycles change (95% CI)
>   64B        66.728    61.220  -8.25% [-18.99%, +3.91%]
>   256B       14.363    14.515  +1.06% [ -4.22%, +6.64%]
>   512B        7.792     7.578  -2.74% [ -6.55%, +1.23%]
>   1K          3.988     4.032  +1.09% [ -1.64%, +3.88%]
>   4K          2.063     1.973  -4.38% [ -8.23%, -0.37%]
>   8K          1.702     1.667  -2.06% [ -7.99%, +4.25%]
>   16K         1.473     1.475  +0.17% [ -5.06%, +5.68%]
>   64K         1.385     1.358  -1.96% [-10.61%, +7.53%]
> 
> Only the 4K interval excluded zero. With the full series, against
> baseline:
> 
>   Buffer size  baseline cycles/B  PATCH cycles/B  cycles change (95% CI)
>   64B        65.282    57.843  -11.40% [-13.77%, -8.95%]
>   256B       14.710    13.813   -6.10% [ -7.89%, -4.28%]
>   512B        7.709     7.188   -6.75% [ -8.79%, -4.66%]
>   1K          4.075     3.862   -5.23% [ -6.80%, -3.63%]
>   4K          2.034     1.887   -7.21% [ -8.67%, -5.72%]
>   8K          1.664     1.568   -5.78% [ -7.83%, -3.69%]
>   16K         1.450     1.385   -4.48% [ -6.08%, -2.86%]
>   64K         1.338     1.317   -1.51% [ -3.21%, +0.22%]
> 
> From 64B through 16K those intervals stay below zero. 64B through 1K
> did not show that in the P1-P3 run.
> 
> This is also why I spent the time making this work with sockmap.
> 
> The value I see is lower RX CPU cost, not another large throughput
> gain. I am still unsure the extra code is worth it, and I would like
> your opinion.

Thanks for the numbers!

Both tables are against baseline, but the two baselines are a bit
different (e.g. 66.728 vs 65.282 for 64B), so it's not easy to see the
real contribution of P4/P5. Can you compare the full series directly
against P1-P3?

Anyway, IMO the big win of this series is P1-P3 (throughput), while
P4/P5 add a lot of complexity (saved native callbacks, new af_vsock
helpers, sk_callback_lock, sockmap corner cases) for a ~5% of CPU
cost, without throughput improvement.

So my suggestion is to split the series: send P1-P3 first, so we can
focus the review on them and merge them, and then send P4/P5 (squashed)
as a separate series. That way we can also evaluate the direction
suggested by Bobby (batching in read_skb() + coalesced sk_data_ready(),
like TCP), that may allow us to avoid saving the native callbacks at
all.

WDYT?

Thanks,
Stefano

