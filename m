Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795307924;
	b=4d7hXsKAplDwXX+u1eXRQ8/X6vH3I+FWoawPWxZZmLL5vjfOkhCnx/jbU9Ce9b1m/zYU
	 6rZCaRXjCrRVHOn6TkyvgP2xUXCChYugq5Q3Vh+qVaCuW9Ypjg1PD3Hst/33Fhrsf2GQ9
	 XpRFwixEnw9fng184jm2TXEmAzZbDQxT3AlP5wdJ3M73g8nwXvfDqXTRL6cSJ9qyb8K9r
	 9Fh96hqn1wC4ZQE5oPMFK+W6l3Z1/tJpx28TDobcCKS5IQHVKdqnL3qJg32tuAd3odWf3
	 sV1Xj3Y99TmCIcqZYAmDrZXmYRS86/2nuzABwWPuV9ao03ajKPWb3m8IRfudM//Rp1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795307924;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=dNUOjrKlYSH2kSxGFTJrsPc4K5z7HVpNOQ8f9jtbfjM=;
	b=3gpI9M2d/MRb92n0tgY8PvsLowPeNiuLMT6KhHh6bWs330mCv+sxUPEbacjo6D5zXvRR
	 d/SqWVdCT6NnJO7Z+4JN5RAo05Ke7P8vwb5ovdBcmJxHjAtaF8XNM5zy8xIPkOyUN5uHl
	 I7Cr2lRYh/JgiX0ZD/g553HWnx0/BzjMtvRMZixj4mHzal+3vK8azWaZraWlYVu0HNKLY
	 AJNc+8JyvBdZsDEf5RS+J6PisPP6obU7fV9Km+eZYoncofaUmaRaPD+hD8KLCerT1C9wV
	 R87/iueOPuZyB8LUF+19M37L4pbJPZNfRR7LgvHsnabECYjvWt9wUKetsUmMD8hXrkQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=B3UlFsZK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F610606A330
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 00:38:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F610606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=B3UlFsZK
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-533202fe429so199081cf.0
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 16:38:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795307923; cv=none;
        d=google.com; s=arc-20260327;
        b=g1p8kpKeyRckw/UsqWAD+zlTGMsEmPKGofVnkBhW+Ku2zwjGRfJsfGyCL9AaNb9Mg5
         HZ1unOilMtpRhlO3zAyMVCP9AjekX1LhzAgI9oNJsPQpp4j8yffEeGFRJG+2qXcjY29v
         nx0lsMcp3B1QdX4QrcLDRCzRz9RL9m/ZMtIBcDAwd8h1YIFDVyEwNyMOrIVr+nQVueY9
         a9T2ByQkak0oe9aAm6Upeb2S2DNBbVDOX6kcFIwr6r4i8q9UtkDxMd7gj5/SSsfTiTxe
         OM/n1lTnFfd/ZCWu+Rqe4dZOXR1urhod+kr2HdlmBs9HhgUqcjR8EMNL8iAVC+03J/Ss
         CUKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dNUOjrKlYSH2kSxGFTJrsPc4K5z7HVpNOQ8f9jtbfjM=;
        fh=kw75w4yus1ioI69Rnjy/W77iu2nruDrxu/0w10nT1OE=;
        b=KvBEK7RKInj+8RtQok7GbkCtJKj09JJ3kFm6jOcbjzsBV179Lu88/am0QDm0jqoKoT
         7KRzErjiJGLNKhWXnc0LdPcMBRH37p+PBaxo8Pdbpi8fW4UExxt0hIYfjA6ozXnLydkF
         YJ6pbbxcrj39RzkbWta5Wm5CSLr67wH8FGy0P0n0zWqqTf7DcXcf0Aw/ZMZRiwupyskk
         UP1iGnbzFMBU5l3wApkIkFs+4U4pSJXgpZhwAFvObOoPQwRYao1wyyUv/UNu0635EGmc
         /tV2ZbJY4vshmTm2rZOs/nsJnCLXv/Z7gO/v8EUfU2qoaVeIfntVINeSZasugdL459xT
         cFWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795307923; x=1795912723; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dNUOjrKlYSH2kSxGFTJrsPc4K5z7HVpNOQ8f9jtbfjM=;
        b=B3UlFsZKEavIOlX5BYQ8EASVSk+Iyj8zJcNhpBuuxoXjKmyuJVgeSLOYITqbMMEoyZ
         PpnQOWGk1gKMiYSdfJJHLLZUx5up5G0gY52Zy/JkHlZrTfiHTy1WWMnGhHKiRIZBc0N8
         gORT3JFsv+mNwumzKCjaZiinWLRVus9fApZzScXKVTKVP1hM4G3xkqqfkY62b2HAqaFx
         u5+4AYaYJ/eplwmCtF47fTjx3wm6nQqsOjQb+6Bo/Bw47yh2ZCDBhkI26xVPh3lmxkue
         7kOi3FgQoYQB7tp4iSP34ptUSrs+E3ndbfKjYv1dUhGELoViub42m9oBbiZ7XWJlo9RK
         4i2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795307923; x=1795912723;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dNUOjrKlYSH2kSxGFTJrsPc4K5z7HVpNOQ8f9jtbfjM=;
        b=T6QPzgkrS/yDFzJIGXhfWylVH4fRE/4c4xa/qeBhaXBzPnboFAuZgvIjz9PaGOusI/
         7WF309H3xwoJxVFKVtALPVJDQ2kPR4I2/w6TsfEtZuk0NBx5UIR/Hrksyk9X4KOAykSa
         4QwdQgrT9MMF2ocxmzBRCaV880An2D+RY8/PlinK9lcfNp6xQntHEi9gJJ/7hHGWlfjw
         dhOR/95XmV5X6tZDZDp/pWlM2wihnDywS3nbvWN/F5Ld8asaei4Un+/gFUKhjjftfSnq
         M3GFHtQ178jOwdseUds9wL/+2G7cZTKBS3ubKvbn4GaYiL+F7Izs/951SlTj0fisXWsU
         jNzQ==
X-Forwarded-Encrypted: i=1; AL+hErGproIAL61TFHU885SMl1DnDK6NwtGIZDQaWO3DyjxeUxwJE/fFJ9cYw/3z2yovyP/pp/BAUxU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CyvzsAAOS+no7yo3Zd5+0I4oIHfvjqBAQBegV+aYYRhKjxXXp
	5a936UVh6bsyvy+Xmdj7vLxCA5rVEBbqwJcAtpw/w8sL6kLPJiDWguMmwpr7+FqOVxNcmwogBYr
	POHerW6ZRwZCZgxk/yKINCyA5xIrnBWGqZGstFzUc
X-Gm-Gg: AZFdTZeuK58xeQw8S4TmJ8HlL0xPHyzapLLBpn+5kLoBUiD9zFwLuNgChcN1JAVGZx/
	XXb1QR/WJhZdWQu5eC3rj0yODEo8idmiXoaNJXKILyi6ZhMZpbyD/Hu9oqd4mrUdsB60sG7nlJh
	8xzrNDqUM8JD1KdkI5ASagzdWuBa4DFcYVx4r80uzKOMI2nCZPI/iLUVzqcSK6pnuLfrUn/oI26
	mKwBSfBxJQvo0sKGbUxVKht6DmedvULg5uxjSV1YUjh1AUKxbuZc4ZdUdqtrpet7sAL49EG0kww
	ts3zPrfLvikjjpbCk1O8X0q0/6GQVLCmF52Ff2hmiPdUxIUMXdggtR070yfViDQqmkxr4WgTe5r
	Sg57RF8TqtKMUVdSpMWldw8t/OMXG7P3PoPfUkJyS4AsPnix5/OyZ6V+KT1QWjMIOe+S2w24WVQ
	JDoxszc4rbplX01u8zq90a+u7WCg==
X-Received: by 2002:a05:622a:5c13:b0:535:30a:76c7 with SMTP id
 d75a77b69052e-55d88102d7dmr12289721cf.3.1795307922837; Sat, 21 Nov 2026
 16:38:42 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122002633.584362-1-yuyanghuang@google.com> <179530755896.3294.9774209097444302196@kernel.org>
In-Reply-To: <179530755896.3294.9774209097444302196@kernel.org>
From: Yuyang Huang <yuyanghuang@google.com>
Date: Sun, 22 Nov 2026 09:38:06 +0900
X-Gm-Features: Aa3M54reqhmE7qkLbFeGbwz_x2KOYJrLIxGS-DJEKqR3eWF_rTNsV3vVaGAA2Lo
Message-ID: <CADXeF1FaD4j4YigpkJDWD6BaSbrOCxNV3PArRwyR5XeoRfg=NA@mail.gmail.com>
Subject: Re: [PATCH net-next] net: zero hw address entries on allocation
To: netdev-bot+sinfo@kernel.org, Yuyang Huang <yuyanghuang@google.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Nicolas Dichtel <nicolas.dichtel@6wind.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 22 Nov 2026 00:32:38 +0000, netdev-bot+sinfo@kernel.org wrote:
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

This was flagged by Sashiko AI review on the AF_PACKET multicast dump
series (see the Link: tag).

>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by LLM and not proven at runtime). If it was triggered
>    please include the symptoms, like the stack trace or kernel messages.

It was reproduced at runtime in a virtme-ng VM booted with slub_debug=P
(CONFIG_TUN=y, CONFIG_SLUB_DEBUG=y, CONFIG_INIT_ON_ALLOC_DEFAULT_ON=n):

  1. Create a down TAP device (ARPHRD_ETHER, addr_len 6).
  2. Add 01:00:5e:11:22:33 via SIOCADDMULTI.
  3. Switch link type to ARPHRD_TUNNEL6 (addr_len 16) via TUNSETLINK.
  4. Read /proc/net/dev_mcast and dump AF_PACKET RTM_GETMULTICAST.

Before the patch, both exposed 10 bytes of 0x6b SLUB poison:

  /proc/net/dev_mcast:
    8    taprepro0       1     1     01005e1122336b6b6b6b6b6b6b6b6b6b
  AF_PACKET RTM_GETMULTICAST:
    01005e1122336b6b6b6b6b6b6b6b6b6b

With this patch, all 10 trailing bytes are zero:

  /proc/net/dev_mcast:
    8    taprepro0       1     1     01005e11223300000000000000000000
  AF_PACKET RTM_GETMULTICAST:
    01005e11223300000000000000000000

> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.

Will include these details in the commit message if a v2 is needed.

Thanks,
Yuyang
