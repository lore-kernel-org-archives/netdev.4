Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794915905;
	b=LmBkAAxjNSkiq6M7CEtpFykxA0ISnS1SoD6dSxqebst5A1/E623ReZHs1YC7XAir6/QU
	 VxpiHsATxbm/jee1KDVRqgjSF5xj3CHvxTR2pbKnyJ6D6ztIC0Cn9jogMN4sdvKD/a/RQ
	 JhZxUsy9TcGU4Vpi6sXsGglZp0qToFXtsM4mm85rK01IT29CfLGZl1/LJgfqJcq4Hd6Pn
	 mz7s9Fp0UfQqUXXfiSetQnB1tgMmRvy0zY6yVwzFM1wPIaSJ6C5VPnAUyp+biCpuCdUBs
	 ZL0KZ4d8lnTX3FMfzPELzLfQPFsg8WdrBARs82KtGFrvDMbZ7JCpBK4oMj/u1+yNHRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915905;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=EHTZ/1KUGWNJTaA44N1B6xy5DZM7ZoLUszGDdI/4cdo=;
	b=zFvDpicanVCpQjykw+585vcgbN7UsjHpJHWHbtLx/T/olyGi6cchklznuwNwXSTimOqI
	 qBWSbZaiYx218Sm2J7K0ylds5l3loMOFLowrauxOKG2uGSDMcHyER33k2qP1v3fGLi2/B
	 uRuPjllTizMsM3WliqFe1D5sJ5Ju1/yD95iIufRorEOHBy57qNjCpboGsH5tj4S1mYqP9
	 DWxB9Gfw8IR87P+nWrULhAcVHvQMSVJuOSp5SyOdKe5KUiIn5uf8ZUEGHKSHiXZferFwu
	 C+DvAPYx0aAfFzOiR20b01CT07BpOcIhMmjsBD6VDbfzSxe0LLkb/Fmh5bUyhIpPBmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VGiaafKL;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36838606A329
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 11:45:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36838606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VGiaafKL
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ed08b07213so21378375ad.2
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 03:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794915904; x=1795520704; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EHTZ/1KUGWNJTaA44N1B6xy5DZM7ZoLUszGDdI/4cdo=;
        b=VGiaafKLm0Xdg+3FKaZmGIukFPRYRb0YRpgodlpQl332TOMfRYzBIo40kh43Y/yMpT
         GvI48PA2g646iMvr6fPnu2MJZ556ul+EKeH5SNIjMMw7FiPcalTQ14hpEgVkeF8qTDku
         fvBrp+hrjdWQJfpzei8N+dhaKgQiY+fyFdZuCBFZHR5Hfkf8cyrPPniI9Nv9j7yRuvVO
         9iJBKo2IWm4WNjIwGOp331BuCujIYFY+O3O7AYZ2geCUFwxTzJRC8KECDBoO8SQzuzBC
         ztDLnmG0FRlFDwZ8z5GxB2yRTws6BG31D1AWMbdNjuUURQXfxFaNRWudTvlqBG7YTDrw
         uM5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794915904; x=1795520704;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EHTZ/1KUGWNJTaA44N1B6xy5DZM7ZoLUszGDdI/4cdo=;
        b=ixFtwFzPT0UoROeUC+v4e0fvkm3R+wMCKbk29kAYyBtYWutxJaesGcM7jedD2hJOc/
         4HW38TifJphTpLSuuHpHKwSkp4McLm55ekgU9gmsnWcNol4wJX8nKhT66gpnBJmKv6zs
         we1BukxpU4gEZc3l9taKNLiHvAChAHbVPu/s5A0nVQF2aIbqhAV0zcHsebJHJNbsZjIS
         jMBZRUoHhje3OPfuOs20GPlYpxmy5t7NV/7kFnGx3IEUN55RlOT5OJPuorr3AnjWPnMe
         FuBFc0RB/sKEAWZli/12QObW5M54sFXF7N6KqtR7G4waGjXyZ7V8xtxUsicPzow4yYDd
         crWw==
X-Forwarded-Encrypted: i=1; AL+hErF+QbUi9ZAX99Hl1JnHSyWH6Omhtm7jCCdPrluGkuGIl3GWs5bajQzYWRLFgaKSGSTUqxPm83g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MGuXssQQUm/gB53T7+jzmescjisLuUgh+MrNjGMrLhS8Bc3ly
	+57En7manqBGrnfm3eEH5mFdrsUZISB/7J2r3M012SGpMaOtw7/XmeL/+/I0dw==
X-Gm-Gg: AZFdTZe+t4jdn2glahZhGM2eNCpiw7PozILVVI4QUAt15wX9D9nqGCNNnxBJRhxCWWx
	9OwNIIAZm1/5gPHa1wCfolyHTOKTtCDMWNND6F34PNLp+CHRiyP6QGS48sThDwLb0/K0Rptj0zt
	auZrp5yIId++wRbBUEAMAA5oOnMsPJfFkpw3YYZpGaOODGY3SaHE2GdO91/nddjB28kIoDvGue/
	/Vy2xSnB70vXa+LIMTEExsgE7h8qX6A7EVocea4sNPPGw6H8dTLlFcfD1Btrc7M+p+74BDKNBhA
	2W/h7qR1l7/F8Zq4WZ51GGAxF7gC5v2zesKINWIzdVWtOM5uIBUtU2MN6wNHz+9ZCwIjUPSqdiq
	U8SoKO2HvqamtuF4GkhCTXeK6QC/LMVYjuD2Ax3ssxVcCKKDapVUkgid1EtjYPBkablxklO9qpT
	U+uiCtmAszsQwUwAQiatlF7uBkO5Q1uTi6cCsmXel219mtf/gQf4bEqcmuY5WOaW3QU1pcRDhmi
	THudmRvINz/ZvOUnqCLhpmW+aVMgTZ0O+EVTlSNplbsCI50AL5JVREc8RsWFnnSMvjuCUJhBj3g
	DvVnEvODZ04uMDCDw3TyNBu8Kg1zNc+I7sTF4jFI1OoA
X-Received: by 2002:a17:903:228c:b0:2e6:5ef:abe9 with SMTP id d9443c01a7336-2ee0dcd0c58mr112203625ad.37.1794915904206;
        Tue, 17 Nov 2026 03:45:04 -0800 (PST)
Received: from gmail.com ([116.162.234.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a1636csm13585765ad.17.2026.11.17.03.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:45:03 -0800 (PST)
From: Xue Boyang <fuchen.dust@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: kadlec@netfilter.org,
	fw@strlen.de,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phil@nwl.cc,
	sunyiqixm@gmail.com,
	bsdhenrymartin@gmail.com
Subject: Re: [PATCH nf v4] netfilter: ipset: fix double free on kernel-side delete during resize
Date: Tue, 17 Nov 2026 05:44:51 -0600
Message-ID: <20261117114451.608829-1-fuchen.dust@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <avwswXiJh8HUPa5T@chamomile>
References: <20261117101018.523826-1-fuchen.dust@gmail.com> <avwswXiJh8HUPa5T@chamomile>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thanks for the pointer. I had not taken that series into account when
preparing v4.

I have now looked through it. The rhashtable conversion removes the
ipset-specific table-copy resize path, so it appears to avoid this
double-free/UAF class at its root rather than fixing the individual
races in the old resize implementation.

I will run the reproducer and the related GC/dump tests against v10 and
report the results.

Since that series targets nf-next and is a fairly large conversion,
while this issue also affects existing and stable kernels, would you
prefer that I replace this v4 synchronization rework with a smaller
targeted fix for nf/stable, leaving the complete cleanup to the
rhashtable series?
