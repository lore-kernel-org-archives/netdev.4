Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794792910;
	b=yHqu7QmFqRjhUKy5EPy0W1VftHoqSLEzKgTlJWmNKopsus9+mnjDeAk4acFsZ7eLAABi
	 2wMEOrwTYVUrIreiKi74KMudI3gmtxr131ghMhIhk1q8QpGLEaPsqraxjRRM1dD/4x0Il
	 TswQPhjxP9KH/JonlrqrWqhvKXbaNWAu5vfBI3KJcEDF7m9jgXGHYtQSeH9ZBKKC6Xn23
	 bWSzfbVzFr2zHC9wpOHZKK0sa3/UINCv5DSaEcOR2jVqVBsjwnXDM/94KgQC8l5N9D5Av
	 A2AYDrdfu3ig9CJQPQxU5h/FFHt2V4i4epVnTOFdLPKl3/KaZlZxDO94w8/BtMWqtLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794792910;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=L2qV2xY4LfpSszQHqfRtrep5k0fN11OSh8rH7M8QE5g=;
	b=xyFMLLUkqJIQUq8qFd9hbOGpEfmAdHEDN10LaPJDBPvZFFBnyvXu+yQag4ghMd5AiJt5
	 YkYe5N+U+dDHY8H/g8ZlHjg041nITjrL4lgCdh5BkuqieSdYz/rQu1NDd9Be7C5x6VQPH
	 5UNM4ksdx5xLXhExJ+J4TLbmvcO4OXt5dZ6aBnfVVccPUpDWVY+TxDyV751BPjLg6EKrY
	 uGTkFhOHDPjuRR2RRBUK7qVaOcsKHLcf/x8Ilu5Sx+ksiEd8JypZ4w9Uv59n55yygW28d
	 I0e0BJS3G3g1+5P48kVgXXZXmHB7Yho39pHyu/e+chDTYrXtVVOKY/nghQnz/Q0mClQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BabyPJfq;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93502606A31F
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 01:35:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93502606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BabyPJfq
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e9ae391a05so16191335ad.1
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 17:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794792910; x=1795397710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L2qV2xY4LfpSszQHqfRtrep5k0fN11OSh8rH7M8QE5g=;
        b=BabyPJfqAmK+vdJmVWU5tHzWp7XdFLw3qxYGCv5gi5HdgxyeyjlcgHNrGRaDgqzLhp
         yJRyymXeweQdDFyMLwy7FrKWqtCarunrDAx+HsqgQM5+dbMT2vVnOHWsNJzPpvqzhxWS
         fXyfzvPeYXE7gn1VJRHswCw9Fl7mgo70OkZlwbsEWDh0pG+g4GFFpxOYEJtJ0As5jjED
         Jlf3Y2ytQsVSXkKC/JdNxDofhPs7LjHlwxTuJ2vnlI7AtIveUh66bc/7waDY7nrS9jAu
         J8+BAlzacxLF6hP9F4B2R8fGp2sTwhO8IouEaNl5ca9IgPA8saD6Z83U47ob92t5esrN
         oeJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794792910; x=1795397710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L2qV2xY4LfpSszQHqfRtrep5k0fN11OSh8rH7M8QE5g=;
        b=bIoq5YTX4u64EM4f4pnb4oe7TwYTLs/G+uaycocrr+yGfsuVFLW3vfET+ckZ7fsAMS
         PNMImk2132i/ScCVoCaEYJ7I9CkYkA42Co8NuTttJGAnaL9WvBO5LltYl1qSxpniB5lU
         nbrhz5k5h5Y7pXrt3nM8QWXI1UaLGWiBvpeIUy1Kpzevw+rm+tTbuZc6uEb9W7KElXtt
         BhWHbN71yofTCwacxcOK90zT97xUuMVrrP+sW3n13xuCNfS1ykJ3GbyToqe+DNy2SnzY
         fj5Uhr2d1755L1x7aoBATdN8YibGq8QFOU5IZqENok6jQlUySMdvCMMeWWI226kZFeuY
         yGVA==
X-Forwarded-Encrypted: i=1; AL+hErEEmqyYrLAh01Oop279yx4sGIuqC6LV3ZeyYOSjwCs9ax8DF24J5KcSXYcFh7P4G2KB6F6Qvlk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YH+7dGi1RIWtLvezzMu1NcrGW8PEKVjwnw6IBysqypu7O6RV4
	xB6YPDvAl63hjNH3Nvdmh/oOTgFSdOGeuRuKeGS0ou9w8CLPyTH5BJ5a
X-Gm-Gg: AYBFou2Dd7Z3DXPMOk5WxdYeqgC30YKMCoZhmcpnCFeK+UrNvUQ4Tonanjv1Rt7UpAl
	D5H3YZ9SlHfs+lrPt8ytLxcieJ1En05V6DPQfbxKO1S9grVw0e17ZCFsOkLN14Ae2/ZvLuDuhCa
	2ROaOWbtohVyDniEQiTCunDcPObZE3vbfIBXnogftBiykNo2BmncJI4n6Idd/VflXAUJW1WmWk1
	tqbaEHZOWw98twkl+XcTyrEzF+wVM4XHu+Gb9kmyvWUGhZO+aRYMXgHdqdqnI36zXgl6KOzb7Ik
	0J+sXL8WQFLPWBdGkNPbPIY4fdXj4My3rPzHezqhTv9na1nm4iOi1nPg9FkRbOTSZnn2+6BlyQ9
	WxThTOr5q1KssqnxYd7aFAEKkboJuDvB635Y3q4Q0p2E9ydWUGIFOa7Th2DF2t7QSPzhy1ZL/+c
	Hesyri+Ol5GqbMgxeXM1Wdcp2CfSLobNsCi8ERZ4gAUzDKOX3yNduBVf2up8MAVf74V/sEH2iNa
	w5f70xn+vy69pazh/p5a6HI+mHp81dW1ZuLXt/sckmGBHJmKUDlTV3JkjOhiulXoRhYWarMH1Zp
	U14nxBQYC3sk25jbd3HbncCTGUAVPVMq+BrzcApeFsfillr4z/azoaUIUDACsMvTEon2moUnu+M
	z6Ey5vPpnGXHL4LyHeJ0HbWFbFQG3jMfL6uerxBhDrFmIrfc1oqAxFGyHY4T3hmqFWJQUeCKlcX
	Oc1MTFDctwmLxMwDwGx4u57BE11IblAi7g3AmCFoXAZJRUocNMcjqYUJqeq5a6gXx46oAgEv5eR
	1KnN6pDkfVQ6hlDxVruKzLZeYzcQeaa3SSkbFPzGneBoxFgEbTQRK7jXoxYEBH1fl4uM4T463lV
	hdktYgdrOQ==
X-Received: by 2002:a17:902:fd8c:b0:2e9:46a9:9b56 with SMTP id d9443c01a7336-2edf206817amr86764315ad.21.1794792909812;
        Sun, 15 Nov 2026 17:35:09 -0800 (PST)
Received: from localhost.localdomain (123-243-92-89.static.tpgi.com.au. [123.243.92.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f9f13desm29358595ad.67.2026.11.15.17.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 17:35:08 -0800 (PST)
From: Daniel Wade <danjwade95@gmail.com>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: af_key: fix use-after-free in dump_sp() on policy migrate
Date: Mon, 16 Nov 2026 12:04:48 +1030
Message-Id: <20261116013448.15443-1-danjwade95@gmail.com>
X-Mailer: git-send-email 2.39.0.windows.2
In-Reply-To: <179477319143.3291.12335649021318391220@kernel.org>
References: <20261114223529.1791-1-danjwade95@gmail.com> <179477319143.3291.12335649021318391220@kernel.org>
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

Discovered by a clanker reading the PF_KEY policy export path. Reproduced on
an unmodified kernel before the patch was written, with no kernel
modification, no injected delay and no error injection, and the fix was
tested against the same reproducer.

Thanks,
Daniel
