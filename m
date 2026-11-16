Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794856748;
	b=WhUBEFet35kn/Yt/3R5VA91efcIFFenQe9Ekc0vuyrvIWn11wmwwfBf7vA5mYydz/sHb
	 WwjbsJsrdLt+cWS1BAheO9jKKkYOArcKTDEsULuZf47wr1hnX2LcspEJyDpYzlVc8onuW
	 Fbzqd6NwwGjqocq1lpJUi3hABEgsxnsp884AQRWKaSMNg8uIzlv9RiLgXQfMcnz+tQGDa
	 wOOcUDYz0lbQpQ/mwJgax6DCuB/Wor8l3tTu1ImmZiLR7R4Sw1TWcJN9C3kFXBRC7TUPV
	 di1z1FjdApEG+G0pSTPFt2sL2grWrjMrqvr7RlWz2tXXW6nUrwpwXKZoRnLcVL5sSkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794856748;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=l9YMzkIH1SfSzcij+sSknBL94aVLRw/+XXPclt4N3RU=;
	b=dH8Bi2imwt82+l6aJrFrVl8qKF12aaruWUfpuiQE6fnIhDaz1arSAtR0Qj0MaY6OUvOq
	 GvPiIwLeGJxxLVKD6GI8w+Ow3qwxLZl36Vah4bT0v8pfICE3k7EsrP8Rj7AHo9rn2UQ92
	 R1Zl9idW0LbQtkQSLoaqmtbZbjKmpnjrkm0THLaMv7dnEeJTH06pxaazgkrMODtHa/00p
	 Feuk2SeUrVKyceWvumn1GhZ2rIPC0D1Q16Myvjly3o+5xfS4A/qDdyuNTIr0AGIuFhN/c
	 JhKvkMEsIk13CHEqnEtb09LmxJK6s2eal2ns5dvrrZTfQWfV0lqLE+9ViTlZKkL0mlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b="U5Q0W0/B";
	arc=none smtp.remote-ip=209.85.222.174
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7037A606A322
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 19:19:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7037A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=U5Q0W0/B
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-9495c633eb5so180085685a.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 11:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794856747; x=1795461547; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l9YMzkIH1SfSzcij+sSknBL94aVLRw/+XXPclt4N3RU=;
        b=U5Q0W0/BpB9sL3BVGBQtdY07qNqn2tcISUOrvcjFpEMnFFT5F6UoSNOnjcIvQobq3S
         /FTJYEMJbjf6ELnRTDPPZN7ABPvBpvRueZe5tk0b9V0LQFApOb6CUfX3HN4CEcPTR+ex
         kI64AkKq8XYWcXZj9tVm6dDeK5lRiSUwHO+2TJcwha8fV5gbuPTo5JfdmanrruFHoDFx
         H+/2c9HHotLbtXN69gX4PQGLwcfnxW5pjcU4s6NUlhDy2r1ZxriSNqv/5s8+iSkz3jaM
         SrHRxVVOyJfoYlwOX/gPPEQfmPi0uHsfMrn0bSbGBK2kLAbN7Fg7OjRWLjVabXvpwAum
         ocWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794856747; x=1795461547;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l9YMzkIH1SfSzcij+sSknBL94aVLRw/+XXPclt4N3RU=;
        b=utvTWRelNt255MRe5oPzG5o89E271ziSibQpXjqfdfYwRaHlYotxgU8Kqyd3mDAiv5
         yYxMsxM+hjpw2rJ5m/EVdw3nuDPEonih1R+LGDG8W81BsFOGVT5KU1xseEm8AIhPYKjS
         V0LqUMOFhyUgL5f1UzJRRWJguu0OxxS3ILwJ92wz1rJzzOv72y92Xio8Iw/mfQ3nMp0q
         6EMmbUB+sDOqVSgHdvUeAdPFZ3V0v4WpX+i2RHH0VQMYP/ERCouphRDOim/FZEjwEWTK
         Uw4giipPwcoBxWx1mj87onNXOc9zPSqXx0i7XFjmwjveAvcLMu3/6l01dxKrikIQJsiH
         L67w==
X-Forwarded-Encrypted: i=1; AL+hErEjj8UI3DJNUK0F2l2/l0/CM5KbGCKy9UuAvLIu0XvyghU8U98F2QAJ9/TcXLKW89GmmT7g2Gk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HAipaP/Yyr5a/8CYwXZ3OAbD9n0OhNzvKKHZlln5pdEPi6yMW
	qqzhmOq90DheqxNJy62C5bTtXa/m3OHZ/UOpKclahYQfGPixuuQTsTdr5NbO2UZMmjtXr+JDahb
	/MVu5
X-Gm-Gg: AYBFou1OG65VP6lJoDcjzbfUC0MjH/akUe7R48yY5paeaeM7reBRj0/qcvgNCH+RTXf
	zwTS5pLRXjfSXJftHL9Xpp1STqviqA0NuCVCwIQlQTr0r7AiEJPiUWuCwhfhew9RgPkVgejQTph
	RSA/rX7VVWg2lEbAR0Uu+E2IR9XTmnY4cOS39jAnhh61FA0dU1gNxZRf9dsPrSufYinhXTppTsh
	dSeOezaWwPoSFOn15VXJwcbymnl56nlyIgWOyrXb+gqy0Yhn8EoGyGF2Jj9+GB0BWqOPmtKZRr2
	zlOYGGJfS/pLA7WF6JENHBX2UNi+ZLL2JaW4mjkmyva+HyX7eeJjjVuo1zbu5XlAu+b3KkkDEE6
	zi42lCwuNIY3eytP1EkHtzOzN1eh1x5xq4xShv3Ld/+cdcqjjTEZ5ttzzmDC+qEIRSeP3aSmUyu
	1dPPRg80/RjdKAmZYKyE0E7g6JrFkzrsNV9J9ubjlYIS7Krg16maFNmy4B2Lwy/BDLCbfUo3x+Z
	e+8JyQMAao9+ajEVMU7o8O6vc7r6yyUzFrS93RuAaE9dQswowtNVV1T0IzBPeD9AIXCOlropGjc
	Pyo4AA==
X-Received: by 2002:a05:620a:2a04:b0:949:7bb1:ac5b with SMTP id af79cd13be357-9497bb1ae6bmr711689485a.47.1794856747470;
        Mon, 16 Nov 2026 11:19:07 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c870ad4sm904654885a.26.2026.11.16.11.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 11:19:06 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xT2EL-0000000AHzV-2bwI;
	Mon, 16 Nov 2026 15:19:05 -0400
Date: Mon, 16 Nov 2026 15:19:05 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Yishai Hadas <yishaih@nvidia.com>, linux-rdma@vger.kernel.org,
	netdev@vger.kernel.org, saeedm@nvidia.com, tariqt@nvidia.com,
	mbloch@nvidia.com, kuba@kernel.org, pabeni@redhat.com,
	edumazet@kernel.org, davem@davemloft.net, andrew+netdev@lunn.ch,
	dtatulea@nvidia.com, moshe@nvidia.com, maorg@nvidia.com
Subject: Re: [PATCH V1 rdma-next 20/24] RDMA/mlx5: Clamp log_max_cq_sz shift
 in CQ size checks
Message-ID: <20261116191905.GE2299285@ziepe.ca>
References: <20261110134320.34408-1-yishaih@nvidia.com>
 <20261110134320.34408-21-yishaih@nvidia.com>
 <20261116093548.GE11319@unreal>
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
In-Reply-To: <20261116093548.GE11319@unreal>

On Mon, Nov 16, 2026 at 11:35:48AM +0200, Leon Romanovsky wrote:
> On Tue, Nov 10, 2026 at 03:43:16PM +0200, Yishai Hadas wrote:
> > The CQ create and resize paths check the requested size against
> > 1 << log_max_cq_sz. The cap is 8 bits wide, so an untrusted NIC can
> > report 31 or more, which makes the shift undefined. A large limit also
> > lets the rounded up CQ size exceed INT_MAX, and it is then truncated
> > when passed on as an int.
> > 
> > Such a size also overflows the CQ buffer size, entries * cqe_size,
> > which create_cq_user() and alloc_cq_frag_buf() compute as an int. A
> > user CQ buffer smaller than the CQ the NIC is given then passes the
> > umem size check, and a kernel CQ gets a zero-sized buffer that
> > init_cq_frag_buf() writes to.
> > 
> > Take the limit from MLX5_CAP_GEN_LOGSZ_U64(), round up in 64 bits, and
> > reject sizes above INT_MAX. Compute the buffer size with
> > check_mul_overflow(), as resize_user() already does.
> > 
> > Signed-off-by: Yishai Hadas <yishaih@nvidia.com>
> > ---
> >  drivers/infiniband/hw/mlx5/cq.c | 52 ++++++++++++++++++++++++---------
> >  1 file changed, 39 insertions(+), 13 deletions(-)
> 
> <...>
> 
> > +/*
> > + * Next power of 2 above entries. It can be 2^32, which doesn't fit the
> > + * unsigned long of roundup_pow_of_two() on 32-bit archs.
> 
> This is not correct. unsigned long in the kernel continue to be 64bits
> even for 32bits archs.

We forget so quickly, long is 32 bit on 32 bit arches

The kernel quirk is that u64 is uniformly 'unsigned long long'

Jason
