Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815842;
	b=GClOAr+f3un8HoQ20F5nL7UJBKfGztXXOg3bQBBJo2HrjiXMdm0esXH6EPK79oBv0/wL
	 4CNS9uIsONMxyFMAP/DM/SXUMwErc8S/UoqY6slvTiM8I5+HL0yc/P3o2EorlOfrlJQDU
	 uWtMt68lXyMDnJ/cnFlCRKn1pCUZnpVn+FI19s9AA72WQfBktSDv2WGoYoCeQvK8HnqEM
	 mk/mRAxgW84dHvdzx2mg0eFtXTaU3c+ifBBX04Pmiv0qgmEciYnnLdlULBIfvLVe57UIl
	 +dwXhHd3Gpi1MLq7lJ5cVuuPH3ksGyhfE79N3mbjWC1JxGxM9kB1HEh7iGceAa6LmIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815842;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=SLFt/FgQNeCvm9WtIbsmMxk/nmBpxXZrRONyGG570tE=;
	b=yuAhHnK3buRvRjRWfzxGHunm11TF3uNxJIWbi65t2CYhxrpp4Ll/UA7wI70yzSowJcY0
	 V3K31wqCVEYjr9eeEyiSj3WPqZ29sup1LIOiJ0aFBFiX+XTllBHP/W6BSDDAfRumL5AdK
	 PMH96iV/jKcYzuzVQ5pUuEr0bWUSMwSPywYbziQmhZDl6gigW9pygAaB1uLDvhfYVsj+N
	 eUUrDSXx5PaCJipbSCffjWS36icDBNxC4W3jOu29L2aUWxHp4v9aNuF2ZK2MAQRAkf4nA
	 /xQQbhRDnXfTESZTlPht8BvoiEcPc/MJtfiB6WUQDAEu+isup7WcsxVViYoPLA2NHJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FhbHR61o;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=R2vxTLqJ;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BFF606A32A
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 07:57:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05BFF606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FhbHR61o;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=R2vxTLqJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794815841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SLFt/FgQNeCvm9WtIbsmMxk/nmBpxXZrRONyGG570tE=;
	b=FhbHR61oTxtSbNozpVannwS2N5h3qS2/InHwJObHvBI29pxBWsNJqI58hD3EQp9PD0Q/ni
	B+lTocW1G5YBaH1GlLdSJ9RgKd4OtJoOPHrcpYr5i1oyOl+W1Z6OdMRPLR3LY/WDEm2Jgo
	I9E+1oN8wXpe++7l0P0CRPI734u1DKw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-330-vG3oH35INXup89jR4g9OsA-1; Mon, 16 Nov 2026 02:57:19 -0500
X-MC-Unique: vG3oH35INXup89jR4g9OsA-1
X-Mimecast-MFC-AGG-ID: vG3oH35INXup89jR4g9OsA_1794815838
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6b65682a122so4391488a12.0
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 23:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794815838; x=1795420638; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SLFt/FgQNeCvm9WtIbsmMxk/nmBpxXZrRONyGG570tE=;
        b=R2vxTLqJyU8Ii30yKLRSYtiu2rz7MA/8Sn+zbq+3WLJsqmWjQiV9/qne3/viqeUpne
         UYKtGfk2+4DOmLPt2ipCB95uBkDYcrjNxo/kaiLG+rojc5o0UyJiRZqy7ltinbYVToYb
         ewpjf45xJxQGsGgqx/9jDkpfsSZylFNbfLCMnb7ytOW/Vuma9rXxO2heJuOUO7XuCkH8
         bHpmbtgytkKcVWkKkbnoXij0TAoxKN1v57G0I63xfrpeALpeD3HvJxIfMQxsrUO0g6Yt
         a8eA25ZgumdP3ez0WYMEF20afYuQN1k+yMUXi8iGOeNwhSYgaBooLHh4yO1gYkAD+5ih
         N7iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815838; x=1795420638;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SLFt/FgQNeCvm9WtIbsmMxk/nmBpxXZrRONyGG570tE=;
        b=ifMRLLDwTd2IfNt529G/gEhWHLJ5JUEHJc2tn7f6/pF2tSEGfArSPbF+4a1ParS41Y
         Cwc2XUoxkwFfUbP57iPMg3RdWGFFgH04THRAVN6FnBtyayZnS0hNRIVBSgdbH676QJUO
         BAxtZ+/Lwg18OGF0mw6OrVgbUPy7fx1Vj2/C6piIJG9Tp3BnT7PpPwPdYolFAm/tn90Y
         ARXixMBh7JtD4X5vyPRh9afs2Vye9Kv2yoeQ0UYZ+x/g3YYveBVu0XJylPyDIX5BscdZ
         z2RLafldSnXZylptxduLNp7aEcBPXEOBOHCDQ0oEyPSTgrt3+07rpb+ks7hpmhrjcmvS
         woSg==
X-Forwarded-Encrypted: i=1; AL+hErFCsy+kYtLBGxJPJ7oHMVJxAgr/d9ZDpl4QmEkC9ZQwe8RIF9XXOFbG3KGW27ytvwiLrEZpS74=@vger.kernel.org
X-Gm-Message-State: APuU4Z8h4HVvg+0LFqkyfSLXLWXui2ykOqGqAxOa9OIKZZAAeszTfq4C
	IV96DpF3SzTXDW3pZKSFB28v1pJova74yeAqIQZzYIY5H740Jb+2jabZDblFvBBIUJ72xq0C+he
	cZNjDXIftks9U+EIuZtRKOsXgtRg5BcV38Wa4AVtU/yZEpTkJwtJ5xCopvQ==
X-Gm-Gg: AYBFou3eVzzTyr8mXFzmSakNvO3tjAijHygKOhj9Ks8LNqFHsb+TCLqmhmA7QE/dYE4
	Bqud8nou2GQskFblRLlIRVCMaykMjMI5aaMJpDch8bYIe7fmG4K4GktLqBVYdRLiLp3nUnGybR9
	l2bPUOf45UEM9Y36Q0vasULtFKv8Lwlk8VRV26gMOSvai3CffQ396tmCNNjUXHV8CJ/8r22Xon8
	9xKCSqHgmzvNR2Fb2ASaqxzl80BecjF8m4vbf0cKz6wzfD+qjHd7YjLKuEV9JaJ/TI4fMxH2IiP
	thBs054sR0zKYOeeaJuS7HQOLbY0xyufjzuOSOCZJfPeVt39j4UGYtj5Hi8mG9r31hLixC+xufj
	2ZUsL+xS3vv3PPJS82LTOX0B5cin2ZhsCNCHXW2pD3NIKILBBEfYsrEcPZ1G+PlBdYHXI7AAzgm
	fXbgqLJYpP71gfriPMJUvGPJQaZbuF0M1StCyKuMpkpKItzHVYqJPcuuR3IA5k/tlNkI3dgAqGc
	stXgrWZRhMHcaq+usDUj+CCXN+nBdoN4o2Q1Jp48E6cPiQmlIG1
X-Received: by 2002:a05:6402:1cc1:b0:6af:80c4:8981 with SMTP id 4fb4d7f45d1cf-6b7c0c5bbbemr7579334a12.26.1794815838133;
        Sun, 15 Nov 2026 23:57:18 -0800 (PST)
X-Received: by 2002:a05:6402:1cc1:b0:6af:80c4:8981 with SMTP id 4fb4d7f45d1cf-6b7c0c5bbbemr7579318a12.26.1794815837710;
        Sun, 15 Nov 2026 23:57:17 -0800 (PST)
Received: from cluster.. (4f.55.790d.ip4.static.sl-reverse.com. [13.121.85.79])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c236110bsm4461425a12.7.2026.11.15.23.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:57:17 -0800 (PST)
From: Alex Markuze <amarkuze@redhat.com>
To: netdev-bot+sinfo@kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH net-next 0/4] net: streamline skb_splice_from_iter()
Date: Mon, 16 Nov 2026 07:57:16 +0000
Message-Id: <179481582370.4133712.12198402768754157869.netdev-splice-background@redhat.com>
In-Reply-To: <179430999926.488859.4270273148397539600@kernel.org>
References: <20261110112325.3263078-1-amarkuze@redhat.com> <179430999926.488859.4270273148397539600@kernel.org>
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

Hi,

The issues in patch 1 were found during development and testing of
opaque TCP payload objects [1], not from a production report.

Both were reproduced in added in-kernel helper tests using the generic
extraction path:

- With a nonempty iterator, maxsize == 0 returned -EIO instead of 0.
- Deliberately supplying slab-backed memory caused sendpage_ok() to
  reject the page, but the iterator remained advanced over unappended
  bytes, both with and without an accepted prefix.

[1] https://lore.kernel.org/io-uring/20261110132006.3280986-1-amarkuze@redhat.com/

Thanks,
Alex

