Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795436480;
	b=lfPgIBBaDBHmIFkloXE/EYdeSjFWGM9JnBxIpa9hnMA9u2OY+BvRTPDxwxbpVvtI4UW8
	 fFxH9Ec9PapKybHhTvu0ci/keg7BJjXV3/WIcKAoCM8cSXWBj/xdyQ85ENBQ8BzUp9z9E
	 uCWfG3GclNGWqD7hfDKE9LMudlPwd0cqDqPJ04gji5PTspMGPNM4X5mNFnLg4yn50xhSs
	 lOU1rqdmSxfkpmDPuJSc8ekg1nal7FGmGXvWhVYcDLmOqfvd9ED1XdjhT3+6I2KfxJf4W
	 j4mA213hCnbfEHhjGuP/JOZc34TZMXcUcLeyL2giMqvvO6XLGGj0amx5YrBMvDI1h0Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=S+3UY8YgKHQ6r6HwEv6iZIETGtvYvXbZwkM5LcLCzD0=;
	b=0WS71FEQ97oRcRY6fPA1MPwuKPOYigPtrad6FhOCSmQPC9zWes0Q6V6f1PkDEdUtHqVO
	 YrYoJKuAeRVZN56E5hpxBiKzj07r5lQ+TZi4IuB5VwbrqRj5yVuCLJ+1Ku8mcpumc9Y1K
	 K4Sqlq9tcHksYG0dRZrq+6UurF45c9slNY8nBLnJ+14ZRy0DB4rDenfjE2N79MGQydxM3
	 XYHr6fqSPEvFpjJiNzNvzbjjsTkyr31DEaEQPWRs9JzW0+e0SacinvHjqRZ38PZqUqyHy
	 4AqV+8Gk0+PUKEnDRRn4VeCzhxhZIR+MQKEUs4AqRptw0ZkQP32PBTE/dLmAmX05Gsg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZNVMMsr8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A018A606A682
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 12:21:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A018A606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZNVMMsr8
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2f03eeda984so16303915ad.2
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 04:21:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795436479; cv=none;
        d=google.com; s=arc-20260327;
        b=o7ucrSdmD6rj1ArVHv15vuECESIUIZoBHT9cuKj38py6DQlagUd8iZEKV7xEODAaou
         rhYbtmmhbcssu+K/kLWd0+JL+ue10lY/opuJ4Rw3hYRsfGY5+oYhk+11im2A0DodvmfD
         mqgEjUrSpNGXUBzsxwdwX5XUQgTe/oCQ9H6DXqy4j7vH2OOWKriNmIlQont3paQ2QvtL
         DRB3uRfYZPJkJBmgDIQAMU57Dthrjl3xJz5YF8i750Y1yR1XYN8JEGf2DKT/S+34zlHT
         JBSt+pfh9BmPUQS0fns1TvpbIr2ryKfE+fI3HDVo5WUPUt2mLuJYK3DnCfK+NkqGsyxv
         HH7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S+3UY8YgKHQ6r6HwEv6iZIETGtvYvXbZwkM5LcLCzD0=;
        fh=YRX9PhhRphK9ADlEPatbPMJPcheh17jn6Qex1q6ywbo=;
        b=VRb3looz/lYNsLLniRD6jYntE0giP5AXZnYKSVO2snEDZKEXQiiP1s2EDWgBfaDOUa
         0QpIw1Xs/+R0wGAxVBFdM7fPVydX55emHlQpVi9oGW9jNQGwp0LG5sQAMEzJxFm7RgYQ
         TwE5yPeJxmNEsP/ujTWetp2BXdNh4gV65SMNpPudCN0R3SsuIgM6gzWjU+rD08DorBAi
         xITKfPwMmgErd1nU3hAzKBuKAKIDQ/8CAYGmIAnKakE+nqf92+VCItZvKhdz7x4t3Zha
         e6LKFy8mKKzb2JquFqi0nyi9fO4h4SjsdnYGZXP9lwTiO9Lne+dJ98esfpPbswKx/vAh
         SRgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795436479; x=1796041279; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S+3UY8YgKHQ6r6HwEv6iZIETGtvYvXbZwkM5LcLCzD0=;
        b=ZNVMMsr8xgBZwMHGgf0llTeJT9OPe/PTJydE7JNTVsNbrKYrrUoxDH1Sk2KsLachsB
         JitdI9KJdwsvuHViguiPP70nc8RfB/emZ7AHkz4YQ7lvQC3A7ZVlv//9W+N1A6hf8Tuz
         Fd5otwAJiuQrh9qH7WlLB/ENHnn1gbVXIKbxSly2MKe9ldt6/Twjgx2KjjWVaS1E/W3o
         /VMaZwgTwWXgFPI3GHadpgV3XTiMVIEQaNxtFYajnYqrrNKYrq5HpgYAG/eT1tn9Z7hk
         FAtHCfUGn6uaHB1tOPirI0/ENl9Qs1NoUVExmVhSdwfhZNm7USZ/empOKW1d18rsFoWf
         KSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795436479; x=1796041279;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S+3UY8YgKHQ6r6HwEv6iZIETGtvYvXbZwkM5LcLCzD0=;
        b=Jn+OT09itL25DZGycYy5g/eiHh3AJTjgOzu6XWw+nBh6qmkBBUWB+DsquJZlwcEjPb
         tJiYw2ZxuAEr+f19HBrBQyRmYlCnCh26PUQ6sZDb0opbcaQ59lUIdOQFkOFh7M7iBHQC
         PZ+J3D+gU8arjXaOK/X9n205hri2P63hZJSpWIufr6ZqRPS0dN/8T7zKO52YOjkxJVzY
         JbwaUaidyCr7qnO3sdpVR8dBR63uviD3DZuuHPrxb8XKKks90IS7FQLWP52xPTrFwLxy
         55GNgriDaam9QbwJl/hLsaPtM5MjqerAXsgw87gFJT9uCjsZyQnl2omWn3/Dj1fI3TIG
         yffg==
X-Forwarded-Encrypted: i=1; AL+hErGHPolI9JpXZzoU2LnHo95zvsvH+JRfYbzs6Z40loZgfRcgxkGqQkT69ARXRdMHx0qZAQAn2vQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UYdb/Mv1VLEhOx4r/2S/V1NT8zAb4oAVBi5hZtmN1W89XXCc7
	QrXsg825MbGBDX1d9NQVyhdaZ858Y9gtnPiAEUQFGDQ6lD5rCrE1GICqjwb41JKwpEM8l3zUEjF
	VEIudIVHtgaZMKaZN0F0wdXC4EKkf5qU=
X-Gm-Gg: AZFdTZfq6XH0WGRBDOCreS/VsUN3EiM8RuG2B/1VQ1tz4rA6HbohGXSniNCVSooRfHU
	nLVR+0ynuvLreNUau7TVa76StOBO9LjDOMevAcuRLv5h+pfAsUYyAXC2B8rbSU037b8K07d2/jh
	UYXXW74mrxqfQ/DpgAZcqhtb/Xs1WKOXZrmJf1u1WgsLkVg/gs3FXFA7VKfMdQj9DqkLGHNSpb9
	P49sZtqWcDAGHaaAAb7MvKSkXVAOiBobav1y5Rt+4VDPAzQqm5/Y5Md+gvG0+R+vEdS/t8UHksZ
	lKLJcNwV2X2dpZ7DBhJ1QITnxqnlQZQUusNGBdDzdNaCLybE6nDelSkJoMsZuCSoxMRgv5ZR1bR
	LDW6mq4WJ7Cd7h7jjTMbKwGANFEnoKEWgUU+i96MM0dVYIzU2H0PUQVMO6YSZmjtBja+0BU+WTk
	3t8ODrJELUFbSgsP5NFRsa+ujxQg==
X-Received: by 2002:a17:902:ea02:b0:2f0:4168:fb35 with SMTP id
 d9443c01a7336-2f04168fe4emr105967575ad.11.1795436478851; Mon, 23 Nov 2026
 04:21:18 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123121325.3137049-1-bsdhenrymartin@gmail.com>
In-Reply-To: <20261123121325.3137049-1-bsdhenrymartin@gmail.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Mon, 23 Nov 2026 21:21:07 +0900
X-Gm-Features: Aa3M54qZQ_AH7l8CEolFlSvCzul0ZDF-gQS65gCmLYJoMaHRqjccaUQe7U_FBLo
Message-ID: <CA+7S2v+CpMWyD89XQiWq5qC=NPQWFtJ49_7mm-GcxTOCt+gZ3Q@mail.gmail.com>
Subject: Re: [PATCH net v3] net: zero the tail of ha->addr when allocating
 address list entries
To: Henry Martin <bsdhenrymartin@gmail.com>
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, sdf.kernel@gmail.com, nicolas.dichtel@6wind.com, 
	horms@kernel.org, netdev@vger.kernel.org, stable@vger.kernel.org, 
	Daniel Machon <daniel.machon@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 9:13=E2=80=AFPM Henry Martin <bsdhenrymartin@gmail.=
com> wrote:
>
> __hw_addr_create() allocates entries with kmalloc() and initializes only
> addr_len bytes of ha->addr, but the dump paths emit each entry using the
> current dev->addr_len, so an entry created with a smaller addr_len is
> dumped with an uninitialized tail.
>
> dev->addr_len can grow at runtime and nothing flushes the lists.  While
> addr_len is 0 every addition collapses into one node, because
> __hw_addr_add_ex() compares zero bytes, so the test adds one zero-length
> multicast entry to each of 64 tun devices and switches them to
> ARPHRD_IP6GRE (addr_len 16).  RTM_GETMULTICAST then returned 64 entries
> of 16 bytes, 37 with non-zero bytes and 21 starting with a kernel heap
> pointer (e.g. 0xffff8188_04857ee0).  tun has to flush dev->uc and
> dev->mc in TUNSETLINK as well, which is a separate patch; qmi_wwan raw
> IP mode and the HDLC attach/detach paths change addr_len in the same
> way, so tun is not the only case.
>
> Allocate with kzalloc() so the tail is zeroed at creation; the explicit
> ha->sync_cnt =3D 0 then becomes redundant.
>
> Found by an automated static analysis scan (Tencent CodeBuddy Security)
> and triggered at runtime on v7.4-rc3 as an unprivileged user.
>
> Cc: stable@vger.kernel.org
> Fixes: cca8ea3b05c9 ("net: tun: set tun->dev->addr_len during TUNSETLINK =
processing")
> Link: https://lore.kernel.org/netdev/20261116024056.1274402-1-bsdhenrymar=
tin@gmail.com/
> Link: https://lore.kernel.org/netdev/20261118125443.1137177-1-edumazet@ke=
rnel.org/
> Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
> Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> ---
> v2 -> v3:
>  - describe the test setup accurately: one entry on each of 64 tun
>    devices, since all additions collapse into one node while addr_len
>    is 0
>  - point Fixes: at cca8ea3b05c9, which made the leak reachable from tun
>  - link to v1 instead of the earlier review thread, and link to the
>    companion tun patch
>  - note that other drivers change addr_len without flushing the lists
>  - state how the issue was found
>
>  net/core/dev_addr_lists.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/net/core/dev_addr_lists.c b/net/core/dev_addr_lists.c
> index d827cc21867b..9613c8a9ed7f 100644
> --- a/net/core/dev_addr_lists.c
> +++ b/net/core/dev_addr_lists.c
> @@ -96,7 +96,7 @@ __hw_addr_create(const unsigned char *addr, int addr_le=
n,
>         alloc_size =3D sizeof(*ha);
>         if (alloc_size < L1_CACHE_BYTES)
>                 alloc_size =3D L1_CACHE_BYTES;
> -       ha =3D kmalloc(alloc_size, GFP_ATOMIC);
> +       ha =3D kzalloc(alloc_size, GFP_ATOMIC);
>         if (!ha)
>                 return NULL;
>         memcpy(ha->addr, addr, addr_len);
> @@ -104,7 +104,6 @@ __hw_addr_create(const unsigned char *addr, int addr_=
len,
>         ha->refcount =3D 1;
>         ha->global_use =3D global;
>         ha->synced =3D sync ? 1 : 0;
> -       ha->sync_cnt =3D 0;
>
>         return ha;
>  }
> --
> 2.43.7
>

 Reviewed-by: Yuyang Huang <sigefriedhyy@gmail.com>
