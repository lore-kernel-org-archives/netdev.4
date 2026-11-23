Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795437949;
	b=vf2VmvQYpqnxN25ywjBUtAnLZagZthepLKFI9R+y2qKj0FQqjA8FduE4PPg9beMaRCex
	 mBnQpeosfSZ7J5dxbvFMkoJZ0mwbgosqQ4MY6aEGum7Hoy48jFG0jGdNklgYvD7sAS8Nv
	 PKFGrjOCFT2v9rOXtme/9GIs5dGGphaBMOb6xp5IZxMHPFfE7We8K/7qaygzs89gsuqRB
	 HVvhvSXTRs9qB9qdTQ6fYobsOQFOUVciOTAtw7HWrsDkcnWj1iqGiNvYwnLaSgN0xbBDe
	 XVZLBA0P92v72A2aghTQopU0Ul2REgafGsc52IMq47zZPuPtSRdBsi31OxXoDwFJExw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437949;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=yPLRCdfHM8E+rFqB3pM225DfAG1VMi+N3nZnAhVKFQs=;
	b=iY2lbRc3cmoAdX+O/9vo1aYH3OPo7lEo1KndKPknU0KKbyzmXrPC0J1uOYFn6Mr7Xy7S
	 0soV8NYKKuI7Xcc4VVkWKnvXPnyg1wTvRjQc9Q93yK90iPvYgg2rksaUqzXNjnz8/QBL1
	 UlpmaUX3LdbmlskuD3A3aToelVw+U+63KGi5ZubCgXg/3S/aOR5pO/Nw9y7wkQqkKgyga
	 cm7j8inrnbpXVp9UPlbFI2GB5dD0GJ9K9mMuuLjtMFRZ23LdsWqVwsV/RQ+NRFb/7bvWZ
	 zBgESSb9qHlyx3iSUHWOQAjTSG2nhiAk6S35+Hpqwdxc1X3YIpu77mpgjZBeggm3AAA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z7SRGe6b;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071CF606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 12:45:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 071CF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z7SRGe6b
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c5133831027so457741666b.2
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 04:45:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795437947; cv=none;
        d=google.com; s=arc-20260327;
        b=rraNiv+usxenAFSgqotaUaqcTomIiOV1oXsWPJzGz3kfwQ5vKawGRpRw3+mhrMCLiI
         lje8as4RUNyxtSr1CP3kGguFISpe1JdTO4bJPAtOujWfrnD4/l6xkk5CxY91u6rUaujG
         T2EPyzcgKQQkU8w6LZlzfqg87Uu5NbzmCSKggtKVGsgtA0HWAXlDHIEvVeaMvYzgQ0ns
         wNCb8p3ZdFVxpEeMH0XzUkPvU8UMUbHw4WWVDjdw9c4LcRSSeZLXbbHTsZPbdU48DSQV
         f0mv7GYcF10z6Pfbuw8/XFh5heWTlRF0GG2t/4nQjpy2vtpkPZvGrFEkh1XCT/FdRlZ6
         5Esg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yPLRCdfHM8E+rFqB3pM225DfAG1VMi+N3nZnAhVKFQs=;
        fh=ZTRyNCwJUuIh38Rh77LM0O19nSZSkvEJsWVshfkpO1E=;
        b=rGwdzzC2/HYMHVDIPb6U9oHi28ps2vrGdy4xTF3lEfKzkbHIrQTO6DRiXX2xaOv/U/
         tHwTp5qurBPTO54KeQMo6eIzI/7030ffqyashwyaWcH7hveOl4pD1q6KAhfVLgOybUyQ
         Q9R4s9hfEZX2IUaTl//0ljjQUQF4g3DY/3yOGCMxA0DQ6sa0/1L4HeuzqtWqc7KoyVhL
         m+BJbB4pCC/6qhlCta2H83HzLAC59AU7Exhr1Ic9qdxVctW6W4Pd+qWYm3JcSOD2PtRH
         pLEFEbEQLHIMR1GjC57XVvZXT03jVyUIjnJG2R7orr9e2RD40t4cCLB19u0z645ju3ao
         evmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795437947; x=1796042747; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yPLRCdfHM8E+rFqB3pM225DfAG1VMi+N3nZnAhVKFQs=;
        b=Z7SRGe6b06Y/gCp36uNEx/x5DVOAGLVKlhnNmtrj8JSxlzf8CQIcEx3qKLWYH7jXWr
         wytx92qG4k1Yc3mXkCQMye8khfZlkjfdLj1mUcIjXztULnlJFMeMHk7m8ilAsWyr/qr9
         YrZQjz2Xlj8Un+kx+MO/KjnPv3Ap/VxTIFOKUV6v7EJ1vJAb5lCesZYvKg96R8c08qou
         3ZpMHqniOnB6F5Tgnr2EhxUJJWZ+Vkc2rapLPWeeuf61UvQfwM2yiBia7INM75dlORBh
         P0nJmV1skZ6dgksGG5EsuDXe7tK1yZk3Zg6EqfOGICzzzLy4cdF1V53qb5BjCSgFqWof
         ke9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437947; x=1796042747;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yPLRCdfHM8E+rFqB3pM225DfAG1VMi+N3nZnAhVKFQs=;
        b=h11p/AJUaYqmByVrTwKLzg4k56Y2m/TfAQJ9dDNjIOe6lNgUfk9gULbNkMAap+0umH
         QZblXzu6R+HXaH6kAfc1QWIvAepM16r/WP9YnfOjbQcYo5D/vZbuO5ItMAH9ajbNf4Ej
         aL7ChB0om/7sIv84BnqtQjaiWblXRVrBh/spMi/WUNx3/eGu37ljSFHm6nTGYKZmzSPq
         6j/SkPDLutcgtvoEmU8gIkMmkhJPp1XJ/Mbm19HrOlYnvCEjs3MUIfqtZ+OEKbfq5nyg
         k0/iGypClADyPSorv03kbWN9+VxJcNXVdI7BcO8yWuQb9tJDDz8BMhBAq0Fs9ZQNuPJj
         lfNg==
X-Forwarded-Encrypted: i=1; AL+hErGiPhP0wy4URcbYZ09a+B0yPmfhZ3SnfCEy0JrhOvSukMtN3dOQ8Z68Yvk/P42nvV1NykTX3Uc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VLHNM3FtDKb6vbJHoOFVKTqvpS2mQZOi+ARpX+tgMQ+IJZz7W
	27R/b8pM22EZhcXhrIw6UfWlgKVQGjKcyzQzlZA5UabWK9F8lHhp4XDptrqXH1MQyOpFYmzcR/X
	mrh2FtyvW1UJQtm9HNlHMFye3RtX5J/A=
X-Gm-Gg: AZFdTZc9aDcPDkz+0KEIaK5i09GE528X5s12Fx3nACKWQPFPdf77FbYfmiuwzthJLCv
	7GAqyRYCrfRu/iF7AipAWxOOeazahYkvIhyi50TphzQIl5ySH+Oof1MvjWln0SKDvFTB/RlnaOc
	NBO9IRqqoseIEQtHoam95aTerEngQL8dQe2BZ+Ednp8iqeOcjH9OphPkTePWj+vUWTcWIVedO0H
	63z8XneILbAdmQEslec6THqJRzYT6GjWZt/9jLZgUeZOF4tfm4+ySfwBagSX+110GZanL+TckIs
	CXn6KMnYAxmHVx4FkSzOZSwkj2xN43E28ZZlAG5FDj6W4kHS/osmHuwr5O8Gryjl3yPKablSUgw
	Uh4xIJSxBZvKUEDOVPJLoDZfMtQ/PfhuCv3loP3A=
X-Received: by 2002:a17:907:9306:b0:c3e:e677:5608 with SMTP id
 a640c23a62f3a-c513a5da8d0mr881929666b.12.1795437947136; Mon, 23 Nov 2026
 04:45:47 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122002847.616-2-filzador@gmail.com> <179539597704.3135.16978504109818344145@kernel.org>
In-Reply-To: <179539597704.3135.16978504109818344145@kernel.org>
From: =?UTF-8?B?0KTQuNC70LjQv9C/INCh0YPQtNCw0LrQsNGB?= <filzador@gmail.com>
Date: Mon, 23 Nov 2026 15:45:36 +0300
X-Gm-Features: Aa3M54oZYHnNIjFH3z00muVoCT7eB-t3uiLy8mC67jr8s__F0oLDeiykYCOOQmc
Message-ID: <CAFwykAygrO-Dyz3YD-U8f+6FKnq8kc04CtRse2uXrepqZzTxbw@mail.gmail.com>
Subject: Re: [PATCH net 1/2] vmxnet3: drop XDP frames that do not fit in one
 rx buffer
To: netdev-bot+sashiko@kernel.org
Cc: ronak.doshi@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
	netdev@vger.kernel.org, kuba@kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks for the review. All points are valid, I will send a v2.

1/2:
- The data ring XDP path leaves ctx->skb pointing at the ring head page
  after a non-PASS verdict. Pre-existing, but this patch relies on
  ctx->skb being NULL between frames. v2 fixes it in a separate patch
  before this one.
- MTU above 3050: the XDP head buffer is capped at 3072 bytes, so every
  full-sized frame is split. Without this series such frames crash the
  guest, with it they are dropped. v2 rejects XDP, and MTU changes while
  XDP is attached, when MTU + VMXNET3_MAX_ETH_HDR_SIZE exceeds
  VMXNET3_MAX_SKB_BUF_SIZE.
- The budget comment is wrong against mainline, non-PASS verdicts are
  not counted there. v2 drops the num_pkts increment and the comment.
- The double drop_total count for a dropped frame whose body has
  rcd->err set will be fixed.

2/2: correct. vmxnet3_xdp_set() publishes the new program and releases
the old one before the device is active again, and its error paths do
not roll back. v2 adds a patch that releases the old program only after
success and restores it otherwise.

pw-bot: cr
