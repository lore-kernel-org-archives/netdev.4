Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795339813;
	b=AKXrD+j+FNk4zMwwLfNaCm8ZyrxaEi1spi1zuJnSxBfP4L17YzRJWJfEulcTN112lxHc
	 nxKGbjGjkj0NJTVrW2Jov0laZlVu1dc1Ekj15uFRgTjJDLpzreuQBdJMSWoxYZ0BBUtye
	 zJn6eJLweAfS1/XAtHHh9wL1V2RQokFoYVyjXL8vbT96TJLrXTDARETwlTzu72fxe5ISA
	 00eQOpSJhIvb7+Ii978TsqZf2AlycTkaCFrP8+IbBSkKH+KgVHHOBMlkOapY7sxYkYK8K
	 wZQ7Oh9pngZ2zOTnAPYF7AufptzJpbo6pvR96voJzuLdi6KQT88vtDL+bFcwDF3QLMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795339813;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pyMFgkUqM5gnmGVVey0xv6M8Gda9o0y4KsUJ8CsS4Lg=;
	b=p+r1Wnbd8+Qv8d4LVdEkYh7PqBGyvImOY9XxVUMwrc/OoI0gQlgudH8li1yTdvpteUVP
	 f8fZ89nvZjudasm4S0Yh9AEDz+4NuKW3ZNaYNVG815Z2GQJtiN2ZaoZjBHnQ5+5JFQJjR
	 TqMNxRnPxLdSpO5oVpHiAYdOUrqsygespZ8b7RMgMKyjbHYC4D4lC/yrIWeFwIw/gtA0k
	 tt3f6oYg/L5piz5QsVZxV6Cxp/oZ+7xlnuZ+oKuavD8jAMnNywUWaEeD7vwlCpAtCUj/v
	 i7V78ENRRRFfBt/zCHzSzEj3kuw3JG30S0lb7/00LY52bNNnbVSXHuGikJQCROqLDSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=foxmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.227.128
Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F18606A330
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 09:30:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24F18606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj2-f0.google.com with SMTP id 98e67ed59e1d1-3aec0b1d816so1197826a91.0
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 01:30:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795339812; x=1795944612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pyMFgkUqM5gnmGVVey0xv6M8Gda9o0y4KsUJ8CsS4Lg=;
        b=zOo+IJ4UHs4fEcfQBM57IyRr+jRMEwvzwGJQCnugndMoJpTedsKFDayhwinrkls9I4
         9UmXsLBjuJvCuzuV//fz2XIUCKdbphsvkb7wOVKbLjBUvAJ/SYYLut2Gsws2+ollt8GM
         tL0NwcWUvkIX5MGUXhku/F4n+GI2SE+Uu87O0f2gpuXDnG0oSrSGWZL1pTmVQTyDkLoa
         ZAsfBrUDX74HH5Ldf4bLxC4w7WYbT/U8obga79JI4ZrZISE4kOlTVI9wBXzHrEZClD7u
         ySv3d+5/dewYAr2lb5Nhopn/WMk9TjCYu6ZQJnY6/Mzlf8AQL/+PyJnqC+4y5grIh758
         C9fg==
X-Gm-Message-State: APuU4Z/mDm/LE/Dx6qU0r/LqriGORRX3059QreDqCcwROBPtvHmMhOy3
	wyJ1H1bH3MWtNEwg0FCwo2YO+oSUvLtsUyuU4tuBHjXUxwUMwTEzbyVu
X-Gm-Gg: AZFdTZezUI1Qbk5EjSv5rLqrFYAf5Ai/WVzYb2ZtPGcwXcYj6h2vRzSh3wbYo0sV+it
	0wg8hnY9BaDecym8LNxZyTw2287repp5/tQp61iqKXzHK4P+HncnavppExQxy+opNlgOxgyzw2Q
	i2Jq4ZmTeZj220x3ETgCs0ZTV9rOTt+tVHwKbtbmusyzfV3QJpwBguPAmEBtmdncZ9dYdGaTY+P
	1dHioWxcMkDy4RPdp5okfuEnkp3+wi13X45sfphKNRqEiYKyDomAl8ziih6zt8BxMuPHaQ3y9Dz
	ebBK9y5T4B9GJ/b4/fnDIGoh5oxc5YiIakKBTShZK/+8rXtjZ6DFJCi9ZT0aMmrV7kEKsaNXrCQ
	JZVWpjVThlA3WK23UC7T8OHRmOfu0FJQQAT9zQDpUYT98/+8zQj2EVSk9KyXQ8g5VhqZKvP7wgt
	YTIiLbaas9eWHppFw4LaUGhoTFlP0zxNj3k+QMPGsK8IOiDXULBeM7WOEQ8Mkz80Zi4EKAYmxtV
	8lkRCMR43Z+SuLq+SHEHB/obdXB17pfs+5jLXNW7PbJAW/9faVBb36sZKZ+MIV80a6hKgwjNej+
	8nf66fIKID/M9N2U/I7nsEHb0XXgbA9ItKWInYJ9oDN21g==
X-Received: by 2002:a17:90b:2701:b0:3b0:ab34:afc8 with SMTP id 98e67ed59e1d1-3b41c8d9280mr6901619a91.20.1795339812442;
        Sun, 22 Nov 2026 01:30:12 -0800 (PST)
Received: from localhost.localdomain ([138.199.21.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad47091sm12368919a91.10.2026.11.22.01.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 01:30:11 -0800 (PST)
From: Jianlin Shi <shijianlin11@foxmail.com>
To: mst@redhat.com
Cc: netdev@vger.kernel.org,
	virtualization@vger.kernel.org,
	jasowang@kernel.org,
	eperezma@redhat.com,
	xuanzhuo@tsinghua.org.cn,
	andrew+netdev@amiga.org.uk,
	davem@davemloft.net,
	edumazet@gmail.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	talgi@efi.com,
	hengqi@loongson.cn,
	horms@kernel.org
Subject: Re: [PATCH v2 0/2] virtio-net/dim: fix irq moderation init failure unwind
Date: Sun, 22 Nov 2026 17:30:01 +0800
Message-ID: <20261122093001.22242-1-shijianlin11@foxmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119094456-mutt-send-email-mst@kernel.org>
References: <20261119094456-mutt-send-email-mst@kernel.org>
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

Thanks for the netdev submission notes.  I've resent the series as a
new thread with the [PATCH net v3 ...] subject prefix; no functional
changes since v2.

Cover letter:
  https://lore.kernel.org/netdev/20261122090557.19766-1-shijianlin11@foxmail.com/

Jianlin
