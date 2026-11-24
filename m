Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795540800;
	b=E/RkTEijiATg+cCQ27oL9eI1BIKvJq08wGOgI+HoY01xuLecDz8CK4wEasEkhRMIT/wF
	 /6M77kPCVDq1axTMLGqbcTtmDihvnmzBSNqJZdyWG+Zs4VPzePb6OOtHxNwr17JjRdma1
	 XQ9JSI/1bwv0gMalUONrkVmYg/UJrujcyEtway1dEIXAE7q1lg1SWqYdxOVEd0oQTsCFh
	 RXbU8Q6nk4YRl3dcTKvy3Q5Vypok4S5lA0PsiW+wgrQVrPfHhMyMkwBTK6HjVU3D774Ki
	 52XDNhSmNIpt0rdWaaSIB5mAfCQIlGlKtcwxYPbmGjVZY2z+t3LMadCR2uw/mafgMXQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540800;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=6Sa4W9FQ13TndG6KfCVgrINI2FSIc+okogULQsXiVgQ=;
	b=jr2yWx+eekcl3xvZlFYo5W+kBEUhzTfEUmDVJ7PqUgG6VNdMlBmouqydmEf8Pwmhgf53
	 J0cf+lA4uOUz+PtZ8GXgoj+C6wYSGzmV2VEsLd/ejfNv9vnow4pxqMEut/TRjJ4+cEtM/
	 yLTDI6j2UTWZLR1JQDKKbmdbu0HFBBJTWN1qs2dJcwVksdmQQjjjy0ZJuHR4CCcg7iKWM
	 M4IMKxyGjch4Jn14luglzBm1QZ2lkmVOvu5cNxIxPesvE3FcQe9hwgXdxrd7uwMr2eXGr
	 KtDDAQY+qgETZ6tdS0z6RD1fU6yNUXF2R9+wTba777knTRI26mg7KNcYOCtaC27lJrg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sEdMmKAK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D84606A32D
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 17:20:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87D84606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sEdMmKAK
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so41249375e9.2
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 09:20:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795540799; cv=none;
        d=google.com; s=arc-20260327;
        b=E3ZIOj/F7tspXbGi5BYYFhyYg6+OFxvIdeTt/DyR6lZCu/W0i9m0B7os9l1i6HdZFL
         QTvmAgizekC8Ge3pZ9Gq6CGC2gt48pibd4k4aETVYuOyPjIantb8u1DRPqmXl/LW1hiE
         CFGvNTGrXQXjvhIAYNOZGMx3d6XekmuitOYHHj3EM/jOie2/XiO5+tdeUmDWddKJwZRA
         v3IMTqEb903sCBEogbbBISgy8ZIveBrssv2XZZEhbPyxo8pYoz7rkqy+/7lZsMM8XcWS
         JoD3a2IXmHyTn7qyjtmQVKijGTTKiI2ed9eOd7OlEiE4gMwPmGoNnO69uUGbq9GCxHvF
         dgkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6Sa4W9FQ13TndG6KfCVgrINI2FSIc+okogULQsXiVgQ=;
        fh=58xMFUUfdcuLxzIGI62HCB02QgOXZhJ8SP4gjyc0p7U=;
        b=GZwZg4VsEcCvoPeuosf1ousTLIVGrkcUINvyMM7cVaCk8tkz1iw2aGTcFfl0jAUe1I
         ILWTL39iba3ql2eDl/zsam5KGS1W+j8OtNN70tN/E4vxM2ZBd8CN27LUZU5gxEs0J8Na
         If+SE+xF5PY4h1YSQ14+msnFeKWn5iP3JYInNaob6nPauzZDMLF2DWQC/4FVNR1W1SmO
         pwPOQx6iH8KBjdiGgA8frzmKIiOB0pyKVyVjZjADmm0LaVCaILbvad4qQE5hv8dVDPbm
         RFFInQdS3LwZuHeQHlYkGo++XnhxfDbIoWC9Yw3RV2MwdfjjHaa+yF6q0h5xoIZ3DRK/
         goCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795540799; x=1796145599; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Sa4W9FQ13TndG6KfCVgrINI2FSIc+okogULQsXiVgQ=;
        b=sEdMmKAKvHAF6+bOEUrtKd9w07tUhTwyCvIlU34VldlORSo5/94WD4gjL3zIgravLX
         i1VWQCmyD/L5b0ICrRoSFWPGmePK6nm38QkNpgKSfWLCunId7wp3XMz/eg8Skqivz31O
         LvcjGiCbIGKLDETBg3RWXHAVzEUE4aRRIZYuet0jE2T7DBNy1SrtreXLoX7ZJOKPI1yV
         GfHI6F2FbzyOUBrk+LyZGyKoZ4Sk65y+9FAaXOrInNvB9h72Fe26mweN2lVZ04w6Jyif
         VYdW1udaWJjDXehNqpTiR8sTi92H5eRe+btzKG7KxYNzAUZRoxVPUjWGPdA9ltPsxrSl
         nXwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795540799; x=1796145599;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6Sa4W9FQ13TndG6KfCVgrINI2FSIc+okogULQsXiVgQ=;
        b=1RKNIkdyPjxR783YjN+vCa+zGkF4cUT7i5+OzDQKve9EcaV3s0WlJ17StXEeZeuprz
         gbk9WuSGeLUVEHqaS1LOzRwIU5bV7Pb5XNgFodvv2XI8Gga1OjMtx55AST+wO6uLU4UA
         UtKATuO1Y6GF5TqTAovaaoDVLo0uuVAu2aT6ZdDnHlY8KxAGKGFJnGY+NYPhF3drMgXQ
         cHNayNyXJowUXyqTg5I5AmIMUKrMVhMONfIGgo6P4U/ELENMZiV0QBEXLnydI3mKREGj
         +l7XkWxb6JD9SVS/jzASU94ojLPfTGTakFVom4/veumzsfd04MOA6QY5iiWvuqpPjzrE
         H3GA==
X-Forwarded-Encrypted: i=1; AL+hErFuwefHhDCiykHUTtKYSnG+vRIsIX0WHd+pSDAoR0t6lvOB49dWY/6/dX2jnBCIMfnwiof9vj0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vQ4n4oybq+Q7BLFJz75t+vaSSRgJmdK8wDRkiopj0zKNj4hgM
	QWlIcSruMzIi9s2+DTzzkb0FyoePxu/Bp5vZzsL9yzF3Cucwd6gzmwZkzgSNMDSp3JSGpME4n1K
	GanEly+jSlrwhmw7ubwsAopRE61VeVfY=
X-Gm-Gg: AZFdTZfxTcj0LIhHI5bB8YN3JHABTwfaqxmjbJ70Pd8ci9ZLVfBfp5RN1Y466WxVZ4f
	GbvANCwDnhGZydmSVuIC93ZFl6nzaOdCzbz9nPQGPY58WvKfgWba3WkQ8xtelApSuldLfta7cA4
	I37IwlgfblDnTT/IoMWy7kCAKnwoOCHFVQvZPEzJZXdUcwBTHGO+nqF6KN0b6BO1lRaM0vXPs9V
	oNBPifMfAzs2FfDrhFqToV5RHvVG8lBAnH0VbJr8M6nuihbNsL7HUfTBQCL8x1BpcmzYbpSMgHO
	axo87KZRQGOkN1/dDyyMF7bFKHVLzUEJeJ0u6E80f0nsvt6D9vv18Be4LfqK2YMsxaTiKoWH8Vt
	Kjr9kKZ2P4Rqj3s+r5x0WVebT0kOegKEBgAFGQy7a31BwVxVBoFNOTm2H82yeLo29IUKOiSdYI2
	lD/Aha6OV2jNNx7nRx/kDNXJUPzPR9wvBXKv1/hSFBqutA4aL8spg=
X-Received: by 2002:a05:600c:530f:b0:4a2:677:ad8e with SMTP id
 5b1f17b1804b1-4bb8892a21amr289651265e9.34.1795540798527; Tue, 24 Nov 2026
 09:19:58 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-x25-v1-1-4432d3892f8b@gmail.com> <c70bad57add6ff8cd52125c698f3f54a@dev.tdt.de>
 <CAHC9VhTLg2FLNf3sLe3+A=q5Mo4gKs+gB7zi5sQT1jizsOPuNQ@mail.gmail.com>
In-Reply-To: <CAHC9VhTLg2FLNf3sLe3+A=q5Mo4gKs+gB7zi5sQT1jizsOPuNQ@mail.gmail.com>
From: Wong Steve <shyckless@gmail.com>
Date: Wed, 25 Nov 2026 01:19:46 +0800
X-Gm-Features: Aa3M54pfCokUKhl-I0LqSXGVHhsd32oCkVf6bc_7JRKNUQctTjfAfWYnwD5gTZs
Message-ID: <CA+X8SdjoyJT1i1Rf08psCsLQyPQ+yU_tAH0rCQPXpkm4DF_=Nw@mail.gmail.com>
Subject: Re: [PATCH net] net/x25: inherit the listening socket's security
 label on accept
To: Paul Moore <paul@paul-moore.com>
Cc: Martin Schiller <ms@dev.tdt.de>, davem@davemloft.net, kuba@kernel.org, 
	edumazet@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org, 
	linux-x25@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, stevewong@hust.edu.cn, 
	kaixuan.li@ntu.edu.sg
Content-Type: text/plain; charset="UTF-8"

> the x25_make_new() function is called by
> x25_rx_call_request(), which as far as I can tell is on pretty
> analogous to an accept() operation, is that correct?

Yes. x25_rx_call_request() runs in the receive path
(x25_lapb_receive_frame() -> x25_receive_data()) when a Call Request
arrives for a listening socket. It is the X.25 counterpart of TCP
creating the child socket for an incoming connection:

- x25_find_listener() finds the listening socket,
- x25_make_new() creates the new socket and copies the listener's
  settings,
- the new socket is queued on the listener's receive queue, and
- x25_accept() later takes it off the queue and grafts it onto the
  socket that accept() returns.

This runs when the packet is received, not on behalf of the process
that later calls accept(), so there is no process to take a label
from. Without the clone, the new sock keeps the default state from
sk_alloc(), which is unlabeled for SELinux. For TCP the same step goes
through sk_clone_lock() and sock_copy(), which calls
security_sk_clone().

Thanks,
Suyuan
