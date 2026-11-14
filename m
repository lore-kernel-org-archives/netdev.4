Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794662358;
	b=0eR2lQHI/UF/TK1CWyZW+CK/yVhZMzJC9i7+HetUE6wgwUBljRvRuk3fv9PiHGAMZ+2v
	 aFa4lwibS5R28fWK3kKn7qg4otol3K0FNF1WwVMNL+BXW3xjopCqNxCYkQ8yxR7zAftM/
	 lIO5rlIYZwgT3mZiQ2F8NGX818GS4EPY8ePULdm9+MqQRftFg2FmV6bEkuG4M3YjTg9xo
	 OhUgUH/G9pF/wP28vARW6LBJ9j91D0dJtrxZYrB9hubxb4eFwDvcqDuO/tZj6sE0bfyuA
	 fPc8x+w0YdmS3scLg9QbVWqHQKb9xk3zrckXS+zB46pIhVeVGHOIh7oUUUm641Aecfg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794662358;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=wxTYhvRvzFYh+gzRWgScWVeMkBBcGFa2zq2R3c9b1pU=;
	b=vRjS4Ay+sNpNGUESVjH+EfFoQJDotB1eVOyJVb7fP29Eclkwg4uIG9WrzQOiwVNSLYN2
	 Iv8Kt3M4zLNYOGWLO4uYlfmcH5/rvEIsdkkhY16YEAs1i2wjD26hpUaaljttOItsjiAgW
	 z1kmiSDVGo+ZyU3srXYO1n3YMGLS3yZnS4+1fv71fLYWYv43ifkwgUiUzBWapCRpMF0nl
	 4IClDsbxa34UVm7z4jESRGmXFtZAI9h05LbY0zMPugk2yTzvcE/0xNLn9Xan6mBryq1qN
	 YGJmk7m9zmiS3+SJB12FEVCKUuHtS3m5UE2X4M3iPrbhKLuaOCboim1T3jCP6ZJeuJA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=grische.xyz;
	spf=pass smtp.mailfrom=grische.xyz;
	dkim=pass header.d=grische.xyz header.i=@grische.xyz header.a=rsa-sha256 header.s=google header.b=AIhhcIk8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67845606A331
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 13:19:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67845606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=grische.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grische.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=grische.xyz header.i=@grische.xyz header.a=rsa-sha256 header.s=google header.b=AIhhcIk8
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4697404c2bso296406766b.2
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 05:19:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794662356; cv=none;
        d=google.com; s=arc-20260327;
        b=XFS5lfyCr8pssjqmANe6RWONgCGuSyHq9kJSIrm0tGNHkGhPF/eZfiYDpP1IUEsC36
         znm9VgRgDpk87AkiZTrk+SM11QWl53Lb2uQhMw+Dx6xR3UjYtgul+jmfxF9o9z76aiIv
         +mhhXpP0Vm24EE5eSDtilyRZf+eiHmKyibqGRI5h1DDEZnu7kbN4HDkV55IL0Zf9CORw
         NfCArggXU8QcqVP5IWgDcKfbhotA66wG0vn324O5g3kEjwcpzp93+C9EgsUQhGZSMlUd
         iYZUR+/eRxcGwkFUEA0OuKYfrFqfefWArvcmRipi8D2CBLwViY8z6AMa8ejXXmnRUnxp
         cmTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wxTYhvRvzFYh+gzRWgScWVeMkBBcGFa2zq2R3c9b1pU=;
        fh=GrHJMKqgsr/fNoi3YWi9L0fTIP6fy4o6lxCqCBbufTc=;
        b=bRNatNB7lePDRLLAA1mCaeUhsV7dI7biWjVcZfwx2n4eMMoHx37DoTDGGCa6f5GQ1A
         WGXEM0ftwNJacAblzuJinnZDM/17g596KtpIImdEjHCrY6U1BpIst+UffEd7e+f03sxZ
         Upr83sjHz23MpbeKFI/N8zr4Yb/RN6I3Xl1XMtodvxmMSS5LEDdEPimlwJNZaNjre3r5
         e61USjat3aDOjbxWEpkIYYLyNE8iiP3CYuejXlqvVEPqEFMat6HB4dc40lMQUChcGohh
         lZ9q3Z2myV3VAVculkTt2YQbO0QQ/BFQu82G4ccPNja/jmsN99lMVmCNrT5cFrGuKYCG
         Tvzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=grische.xyz; s=google; t=1794662356; x=1795267156; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wxTYhvRvzFYh+gzRWgScWVeMkBBcGFa2zq2R3c9b1pU=;
        b=AIhhcIk85BpB5XYi6cQKrNiT+cwhJuJ1jWvI4eV3TZOOah99AEdPKxD0Qi3qUD1vqS
         pRwkjuvf66o/kCetMo/LYQ3YQqacYyIiBzGmz3Z50wqEcBxLPUXevRrE58C0b0nlHE19
         rM4F6FX0Z4g/lOcbUqCZx5+hWvwx+cdKZ/ctH5H8u+CPcnjZ0TYa8L6a+aDHLI6g1H3a
         DZPvtV6IiS7DzEti0DNFEUrwRXgAAPLZDuaYY/feNgGzDL1u6ERtphD/ewuSaNIqVBN2
         yTNVNqXW3PVlCzIaoVLUkxAmFwhutRm76yxDgwl/L6fRhnxPTKrTNOK/jyoyouFqow5Q
         aJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794662356; x=1795267156;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wxTYhvRvzFYh+gzRWgScWVeMkBBcGFa2zq2R3c9b1pU=;
        b=XMtZncc8ykFCMPtT4IjLKhHqwDYHTkuIpMPv8uFU9kKvbXFTSvKNm/lm5lmTYHeY8i
         uEZeyBav0Fy5QA4qTIYTpFvvTRZTXMe+oyhIej9xk/60r/+QrS02YoiC7R/xNSR6rfE2
         2k19qPsN31rXwG7Gkg2ZdxgQbq/ix+DOH7jhzma9sDyOrPCsL5HYcJ2SftCKzCjHCyEv
         5ia9r283Wp3tdvtid7/DuNvrNOhWeHK4rzHpKVVjzw2K355VJY2F6b+Avp54C5fmd9CU
         ZxRhBrZhrEEkgi9MAlrxyDLbhoIHY4Umehd5HScwaGmBGafmMtvnICfviWYGhR5YGkST
         om+w==
X-Gm-Message-State: APuU4Z+YGwZ+l3KVL9iMTSWt8IK27qy8gMtfxfqg5FgYIcZI8YvVs3aN
	bgYFX8pee2L4OWbOEvyEYjkE5mUhVcO4iSaw+nmLVzCAmoL/OU4qd/IYtl8dD/BC9mCzk+UyHtv
	bk+uI4SYGamD6/Qf5AFF5ggGyj4M5505P1TBYDS5Xd1zMVx79R1djtVs=
X-Gm-Gg: AYBFou2+sQOvA5KdYFVikI2ilrsDgepoUZWlfZv+TdAzYgN2Te3QvFqadHA6vAaYzhu
	+cWg8bBxkTTa1Fh2JKz12IzGGT9PEYTeZw8Bwf5OKFIwifd0PtjpEMwDCCNM2KEDJZowOovr/Jl
	fj7zS7NpJKXEDXKsR5lvggO9zkLywnv86d/1uVukFyix1kVkKkBsglR0YUqrNnNh66/m3NHQEyS
	YimhMbV8LyZd/M7u9XyNzh9mWjK21hSbF7tfxW0ZRipwEurVjs3d2eJXp9yWXS+9ivY/UxKvWz1
	u9xoZFQI5P0qv070c4SZXL4mj+Y8uxeCJznStgSpNxP/7nW/ACqiozoYYch1Dq4ZfTzXrXb/ENX
	xiM735S8WFtAfwCI0A4POBQvgq+Au+hYEMMrjvZ3yNI+j5AYgv2leKorEWtjPzxgT5pxg51o=
X-Received: by 2002:a17:907:9622:b0:c3f:dce3:20c5 with SMTP id
 a640c23a62f3a-c50968394b6mr566230866b.44.1794662356386; Sat, 14 Nov 2026
 05:19:16 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104151914.2651241-1-opensource@grische.xyz> <20261104151914.2651241-3-opensource@grische.xyz>
In-Reply-To: <20261104151914.2651241-3-opensource@grische.xyz>
From: Christian Schmidbauer <opensource@grische.xyz>
Date: Sat, 14 Nov 2026 14:18:51 +0100
X-Gm-Features: AclHuK-t4Vi3tD5hB2DBl1bIr6nwi9vm4FOrc1kbogOcAMqHwa7CaPoB_seqTKw
Message-ID: <CALsH2cy0OUN+6EA3Jt0e8B5JGGhVpyR=EuFOaJvxOv-LnfOOvw@mail.gmail.com>
Subject: Re: [PATCH net v2 2/3] net: stmmac: dwmac1000: don't discard frames
 with only a checksum error
To: netdev@vger.kernel.org
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	Oleksij Rempel <o.rempel@pengutronix.de>, stable@vger.kernel.org, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Aaro Koskinen <aaro.koskinen@nokia.com>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Replying to the Sashiko review [1]:

> Suppose the MAC sets ES on an oversized frame with a valid FCS only
> because of bit 7. Is that frame still dropped here?

No. In threshold Rx mode it reaches the stack if it fits one Rx buffer.
It is marked CHECKSUM_UNNECESSARY only when Rx COE is on and the
engine reported no error for it.

> The giant-frame status is also no longer recorded anywhere.
> [...]
> Could the status parser be told what bit 7 means (Rx COE enabled and
> its type, ATDS or advanced timestamping)? Then bit 7 could be part of
> the mask whenever it means Giant Frame.

Dropping or counting such a frame needs a new argument for the
rx_status callback, which all four descriptor implementations and both
Rx paths use. I would rather not change that interface in a fix for
net in order to drop an intact frame, and I have no testing hardware
on which bit 7 reports a giant frame.

[1] https://netdev-ai.bots.linux.dev/sashiko/#/message/20261104151914.2651241-3-opensource%40grische.xyz
