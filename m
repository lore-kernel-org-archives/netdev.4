Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795587874;
	b=MkM++dQNjbKTfHA2qcUi3gqZRTkosLP2Ms0cbor8q7h0gk13Rw7iZrGN3Owx0yCBp7Ql
	 hGZFQ93hH7P5IJFk2B71Nqx3kc+CtGFNFvhYQsYcWRv47lIFgc7doJXcu4qWUJUc3Lscd
	 EG0vDZiTinZnxlObLr88cSJRxAeVqgzvEgVSvCnXu5SZeIgV+PVchrW06qCDMxAqwyhFd
	 qMSIl+kISs7ckz0XCtGQhzDu0LlHfO2EqCYSwftyYkYbkwe5WW/YtCmLpX43rH+3cxb6N
	 X43s0c49KPPIxrzhzMQBfe1DYTzsyOFupLSUrruZaD/RWPFV7mhF15tDZ5rrToUHV/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795587874;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZQsWRLmOjI6MWITE5i2BHhTTEhDrYVeR825HJ9sXg2s=;
	b=H3ZAOil2mn9WPE/ghFiPVtAr8WyHujqANEbFJu5/CPPn16fkFqe0Ib7mxK4E3ahyDVXz
	 ZZ4Pyrl5PbPSbUXs4ljtARH8UZNnKvJWVtEPXoZ1EGN11h+195/YeyFG2t0mUUC/maBeg
	 JXwVQBBVKwllfkM5rD7YeUz1a9HEZX4RZeAECWXrljypL4nuToMak93NUqZ/AgFY7SIGY
	 af8PjpDE7swH5xtx8saGIzN1FIbExtklkG3NJI2OKetMgkXvJ9o2RGE1YwfTIQCTZAmJT
	 qxEYulAQv/dsFq5FTVB95dMKyhY1NUGIXqJWqOOgCjWlY1KZKHxixvViAvCMghN/j2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=ArV2ryvm;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B39606A321
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 06:24:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2B39606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=ArV2ryvm
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cdac6d19ddaso2115396a12.2
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 22:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795587868; x=1796192668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZQsWRLmOjI6MWITE5i2BHhTTEhDrYVeR825HJ9sXg2s=;
        b=ArV2ryvm/qDFsW/4BJC0tMGbCOx2gT6SWvkk2itkNge9rQIPDAYUHGyHGeLQquK14z
         LtDohwxclssuBm09UuyCAuokUt0RIRpXxuQ/zzqQgRqvdMzHfLuW7Q4N8iyTcfVwiaoi
         +WpcIhYtD7BqMB49/MS4wypCCURlt2ttyZUO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795587868; x=1796192668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZQsWRLmOjI6MWITE5i2BHhTTEhDrYVeR825HJ9sXg2s=;
        b=OqwGw5PSzz58skH0VmFLNj3ocZSeFkg45X0WGPHKvhLRyapVE+5um7eEvmUr721rZQ
         zJ1VKli04be0NsDUKISiz7n/SSrW5l+KFAjeEiWKaTqH66qRRfiLCpFb7GI7bKUPMC1r
         iBGNSQphJ/H7oiAUdbjxZAeD/H0qrMIamjfkwPmPtbB+nXxXJw/n7cFw9wzjOnkLypLj
         xCib4hdWM3QtdjaAhcSPUUn+tVzfB2bF85DCTU/oFxxVN8jJQbECslT0PduMbgfuARNu
         AFqFi8k/ywEVb6ZbfyhQ3nIZXRCOH3cB56htC9+N25hqKMYw/e8Qxf/j8M3KoYzOxWL4
         DOGw==
X-Forwarded-Encrypted: i=1; AL+hErEG5/BOibl1fDfxCGN8NbNEmwz992zPtxZZbGF1E7J+RVcnB5xgid3RtWqGqb/iMbpJkYqHrMk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UrpLh++ys3z3YOjyf3Xpr8X2sO2/BVH0IU9ZBZEtgnmcSKmpl
	HsgJ/ZGnxQAXudchrNZ/P+aB/zxF9CkIXBBMgys50ABhwzkO+dZGnVwVg3e9fc95Z+M=
X-Gm-Gg: AZFdTZf6pNFKyoEWKse46ZTYfJRQcDNQmmK2TlY/BK+mXvkgfU5MaeNCq51UxuLnm+o
	MnDTj3xeodeBwquRJkZAc7AGDiWNYpuN/4/62MX+3lnYnkrEYhXyHXeLmiowBR+FCjaFzMZKUlt
	1SUaQNDme8rQDrq4b9NNpCeh/2RYpop8soQZE4oxE9bks0mjxOYoDtqomHZnfbfAqYEUwmuUCco
	sWoUP8TwqogIDI8YrCWDZn1yOMuqDtQEwe3tVR6FmKxLWkYZyXPrMVDmqUmawI6urgNNnMPUvEm
	fL9TIg3umCcE4W1AgoX8Ex3dKZgmCqe2z0dmknHbXI6jD9q5IeymFgs6iGjNjJMdwZ1slwxmbT3
	xZz1J3fwUFW9Pp368GKNwjAdFKf0wb9DSJbBWZOH6jEwL3+vSgoorqzZyjZAcRO9C6nDAmI7TbW
	lOFeTChbGRkRLhKEXGztouatOT0tg0mB7ErNCXHVjwNnH2FcLNwGCAFr5P+cs19x8OHulOmkT08
	tQKhN8RSIml3dxQj4yqk9YI55FBjvr3KspkkXGWwEEz+v6uuU10tldatLwfUaBD2yoym99xV2MR
	dptxbKUu2Lmqzc7Hj2+TAhkOUf9vTLEQH7uNdG50NP6bWWH3N4orA7lSNmBrN4aLeLIHHywKhNC
	vkXc1bTa4G+T/e2i4G+IIQ8tbgZQWAUAQYil2D1vn1tZLGRYX4aeeUyG5MeD8bB9xDIij4+Ver3
	voVuEX4MNVsw==
X-Received: by 2002:a17:90b:3d4d:b0:3b3:b71e:b2f3 with SMTP id 98e67ed59e1d1-3b41c95967emr16704304a91.45.1795587868123;
        Tue, 24 Nov 2026 22:24:28 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecbd0bsm29191820a91.15.2026.11.24.22.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 22:24:27 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: johannes@sipsolutions.net
Cc: kapil@presceralabs.ai,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	piyus@iiitd.ac.in,
	stable@vger.kernel.org
Subject: Re: [PATCH wireless 1/2] wifi: mac80211: do not copy the mesh RSN IE twice into the beacon
Date: Wed, 25 Nov 2026 11:54:22 +0530
Message-Id: <20261125062422.948748-1-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ac39fb1720fc03069317f8a74aa0f34d86db2e30.camel@sipsolutions.net>
References: <ac39fb1720fc03069317f8a74aa0f34d86db2e30.camel@sipsolutions.net>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Johannes,

Thanks for the review, and apologies for the delayed response. We have posted an updated version of the patch addressing the netdev-bot+sashiko feedback here: https://lore.kernel.org/all/20261125043805.883952-1-piyus@iiitd.ac.in/

We also plan to send a follow-up revision shortly to clarify and rewrite the commit message more concisely. Please let us know if you have any other feedback on the changes.

Best regards,
Piyus
