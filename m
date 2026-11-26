Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795651988;
	b=xZ8B1n6cCTjcLzicpUeNCYEqy4j/e3rIXYDrYRZhpgx8Vv4PvLF7blHpJn9PUMa4PTPT
	 t1ZDksFuFuN3dNA0bvac9JZPTwNFuSHBc4j2H6A8hXRQdZij2JyhCwhvKCc2/a/rqYoku
	 UXhdZJXVuPWV7iwbOkF8nXIKP+oOuu2YzSAjWQd0rQhPjY7tAJyZ/Otdp4tqteVC+uNhb
	 gffJMo5X07lTZFx2O1Xv3kA8w9cjfMpC3XYzAYOmK3xrSyB94jJ3vg8GFpPu3wnUE06/A
	 U9qpdntI7b9PdmEac6vvAj7b58G/6iZP9222iA1VC2F719n+ZR67tsEKZeSdmaI6Xrg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795651988;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=m+a/3dUR/m6XHDL8SgjwUi1VZhGDD7+ERJ5Rr8mIHKk=;
	b=k3tn3ohqHh/CpKRcg8PsnRrqa3877KrJoo7Atqk95NorFYo0Gem6sP938ixVyNJde2Q+
	 MONIEtz+xl2jdeVwbic25LkD44pKgpL4k4KwNK22eGb04dA1JW2FaA56rr7CdddcxlHHD
	 hAeUXn8ySnEGtz8JY05zAoNx0XNzlnmF08O08Y8hqUTjOOdTI1VtvPdLSOhu0EWy7j7b3
	 JZUnqFumvCufnoEjtDCuzs0baTn/saqL9L1MxrnBm5sszcKgSM9KX1K3gv4vHuIrfSWr+
	 8FvtlxouvPm9eGWLY0bk5JtA/oLlOAcOMcrS7Q9i8ih1UGyYDTP6ySr+vVrK5CYHOdQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N5ZMaa78;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D02606A327
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 00:13:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3D02606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N5ZMaa78
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso46774535e9.2
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 16:13:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795651986; cv=none;
        d=google.com; s=arc-20260327;
        b=b/Dhjw+mM5yxunrQ+4I+4yLuOtI7F9o2wsBMy+qK55A+nnpbjZ90TMDg7R2UfedJLY
         u9LBouxXni8a/wcLcomV+4khUVfdfj7zx2SRa8XWwIzpXfKJDQDlsvaP8JySMh6GVO2s
         HV8L5hwn7HrhM25/5/+Q0r6XNmyKfYI1LCZF7K9m4YnghYT6XZ5VHlaO0ki+AbOaqSa4
         1sJKoLzmLOeblps/+GwKy7/O94shQ1Q9ZCDJtGVlu904YQ+KXBHksc6bEqpeaodi7vPL
         gjaBwbhMM2M/Tu4ZGBmpUWEmzDn00RRTDfMaKHp0cyaa4Zn1OO7bVyL9qNOA3vfxwZ2o
         imPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=m+a/3dUR/m6XHDL8SgjwUi1VZhGDD7+ERJ5Rr8mIHKk=;
        fh=WXiSylqRVHB/yDjrJrTou/iUKKltum3XxcttC9E7aeU=;
        b=fgwJWnWicAH9JliqukSvfBZCLyIUF/hCpOAprIyLp4yfBitc77480HMBR5wji+x3On
         0zHaygKWaqF9kUyZl+SR/C8KtuI1gWdDKviRUY5uAXViHsSDMK8V5dRSCyLX8cOzD7xU
         F2weRyEp06okponv6Fl7OKUcw5JuaItO0eo83d0smL9jOrCYMrHMa61TxWPHW6y9Pa8h
         xSrRH0sI6zsv5pQHqcD+a41qHb/tt/6S7FJ+H5AeUTvMqeglbMlct1uhqie809XRDxAF
         t40VXK2O1BPzmZxa7rY1JBPrVki2pTy2yroNPDzpJN+JoTypnzpsfKg6HxrPgbi98jpL
         B8DQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795651986; x=1796256786; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m+a/3dUR/m6XHDL8SgjwUi1VZhGDD7+ERJ5Rr8mIHKk=;
        b=N5ZMaa786HVLIXm4kJLIBp+7wktWZwdl5Ff5A4tnHAaGTbg1dOQN9JC9rn/kUqy0cI
         +06XaTJghywoq+N69s8aZo/Ur+L46R2VyCWfGB/Jyf3wZhV6HfqhlvNCjpUE1MYp3hkO
         8fKCzwhV+4vDlYO902/9eXQbM8c3grv6SA3bfa9biJe3JOM8HAMTwWa0wEL2qWS5Tgv0
         A4TSGPBgVu68BtZsWvKX/lI8G28y1QfacQfqnOpPVOMtT5yd0Ugp/tyTLrsuedk2CHVu
         4//c5aQtjPtgipJia4CT8MkHRBwL3U5d8lQ3NL6fO9wIw1ULxwGHZqDmp/rjNEGOneZM
         O+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795651986; x=1796256786;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m+a/3dUR/m6XHDL8SgjwUi1VZhGDD7+ERJ5Rr8mIHKk=;
        b=jV1uirhi1QudWBpaxt+UHbYIqaXZOTkB3VqsXry0+3y2vzOzkWzq4mWwTPs1GWL/i+
         jBFtyXXLKltisRZ7/keDHMVbr8Ml2uWWcFU2r4b6yJh09ExqnuPer/ToX/PoBlvS3xL9
         uuCq8Wh6e1353Gc02uM9BrWAr7otWUI53kp2OBYVzX4VNw6Vu37E9HtpWrkGiNISPU+m
         8uFGDPuHCF4PW7CAfJI3FvRNJHv0ZHao4+KUSIq2G4vIeMmWjKs6KCgTrhVdoc2m1r2V
         hEznAeemWA1xjnESTkvXgSJiK7cJyboBoY8vyoU5Fzi1zdb6U6qusI0jdKtLhtQt0FxE
         7ZYg==
X-Forwarded-Encrypted: i=1; AL+hErGiH27z1RVLwcZuOzHADoU+ywXRC8Du+Um/iV4uV4IFi+LPrGC7LPYLgndL772CUlzxIwlv+BE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8EY48Vll/z5S3HYJ0RElDxNX0UprhIoA9uFZPRaR0+MJFKbkax
	iSftdRTEGrB7gZm8sjkf4IRXuCVR8fTjwSIV0df5az1mZH6kGyJySAQnPyug6oy5ERTFl5TBWdx
	GQKbS869IniBTOMQ0Ol9VLsv0MM2Gpeo=
X-Gm-Gg: AZFdTZeE/Q43lVUTceh1HKx3xjsJTavAxHcMGD9xAignOVDUFditY1wVubi/Z3uDEOp
	5LagrP1HM659+dSRfflc+4X6wdJZtbfE/6aZ95mJhw5afc61gNIUDkpyLCiUjrWXLQEQiGXJ7AS
	5l+cWLZmKblU0MpHO2GdqiksMoCPm/fa+enF7bP8kS8n+ivY2VbmamU6ugJlymdfD79SEd8V7Bw
	QNym+gpttsSOow5hocDvSoCI3ux2qn4y976FTd6UQYi/AzpwNV16WjhaXmm6uzwxDgs8KTGPN9f
	td1bM0LtdaM5M9C1Owslu7zO2qec60V/PFDBWaBancH6QZnAaIIk7s6Y5RsiODzINyUA5U9ihLo
	ybizlkoDaj8ey3f+gR+1M//FySdDKXkW7xfjhg0/2FZQOz21DTnxGpvGCbc6FsKptX7E=
X-Received: by 2002:a05:600c:3ba4:b0:4ba:493b:3401 with SMTP id
 5b1f17b1804b1-4bb8880abafmr462648765e9.9.1795651986199; Wed, 25 Nov 2026
 16:13:06 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120102754.778283-1-magnusleatti@kernelriot.com> <20261125173155.2073979-1-magnusleatti@kernelriot.com>
In-Reply-To: <20261125173155.2073979-1-magnusleatti@kernelriot.com>
From: Giuseppe Nespolino <g.nespolino@gmail.com>
Date: Thu, 26 Nov 2026 01:12:58 +0100
X-Gm-Features: Aa3M54qC3fGsiPPBixEGOnzpXrpAk5AzehFlhpO5G9XQuOCyUKhWAYQx7aS2YrE
Message-ID: <CAKx9m6MuwhnMGrcy+bBoCG2X0F2T65jZfhbSTGH4-YmsXGYm9g@mail.gmail.com>
Subject: Re: [PATCH net-next v2 0/2] net: stmmac: dwmac-motorcomm: shutdown
 hook and Wake-on-LAN from S5
To: Magnus Leatti <magnusleatti@kernelriot.com>
Cc: Yao Zi <me@ziyao.cc>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Awesome, thanks for the update!

Il giorno mer 25 nov 2026 alle ore 18:32 Magnus Leatti
<magnusleatti@kernelriot.com> ha scritto:
> Thanks Yao, Maxime and Giuseppe! You're the best.

Thank you mage, you did a great job mate.

Giuseppe
