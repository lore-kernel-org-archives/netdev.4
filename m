Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795126281;
	b=H8GWlY4G2++BHdTCze6knZOCo9l4MJWsHvq6vUGo/qjdA9iblRBM76genfbvtwJArT9u
	 QSaRsQW895Dwu0NXuvzTrGmP4aNsyGBZNv86TZQDTuOPI66oHB4C+uGPJq2SooE22ag+f
	 bWhdpWku99isDiYRyWdPOZC4S4dVXyP5S9FSPAG74zgKQ22OvGkfS0CIGf8k3BrI6dvy4
	 Zo1OAmmJp/4Jr66RXFgx0E1TTvSY3+io8mFBPPdIeD1eqOiLyhyDAi2EDlWgZg498XqB8
	 vcSjAGk9bkQt/s5BYyK8hUXOE7+Rl9vMItBJAcPMwsfQSygk+t9A8grFfuZxw8b2wVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795126281;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=S6z0DMoHuC28sLdr0uLqXe7Y05fYwZ5CoY14YxaZzV8=;
	b=pglSDZZWcgUt8wKgEVeHesI4/b7rOfBKOn3ALZgIWBDFsJDJV2Lk8EpQCf9Vus/fcvnT
	 HYXT7wldJEiAXBdAVMjF5jjPqyQvrxvEVOGOaOoRqRjLXOky+wG9lQ6oTvtHrbobxg3qU
	 xgl1yjUANIjK5Js0yUpuxQAIoDRC0mLuTDgamv7uuX6bGXixWC8qrW6qa31RSSLotx3yj
	 l0iz19r9TnR4sr5nfSyUYaatMkedH2KqFv1zTGiUVLYMc81xcLCot0UyRPN4w2wVzCKZs
	 rC98vtUNEvtEmUvxd7ChM94FWMl9aWtp0sWSEqUBtum7tremBA1LNC2vrwAJSN5LRCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YBG+yypc;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADABB606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 22:11:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADABB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YBG+yypc
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b402824d07so228891a91.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 14:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795126280; x=1795731080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S6z0DMoHuC28sLdr0uLqXe7Y05fYwZ5CoY14YxaZzV8=;
        b=YBG+yypc1bL93icBMdxeI1UjHcyswVyMsLZHow27moZQm9tBOzXMNUWR6hIB25y/Wt
         0XB/hIt4sBB0UELkjgLKesR0j1FN8QxOWcOd+cD5amOwBl9hBEg5rJD0lu8eG4Cuijag
         9za06U3gkxB/d4KR9HlJCtV7HXrI9CDRO9wbE52N9fyPfaOzUm7wnKOMLtBbF4bis2vx
         N9eap6niuBtdP8y2FHFN7kwNSCxv8UF6+U0XbM8DsAsh471INu0ZDeUQh8+LfrYlzaRL
         Zg2iSvAm4pFn5zNlvg5H2M6jvxGv4GPTBk1xkvT7bxvDQuiD7/tIdCIQ57vh40s9y7J+
         I6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795126280; x=1795731080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S6z0DMoHuC28sLdr0uLqXe7Y05fYwZ5CoY14YxaZzV8=;
        b=1p9SYzzznR4qBCCXIkiBkliLNJZgWAFevewtwdCEugrCyajBxeNt3Qdr27CFDbIU0P
         gKpgWltlzBS/TncXB+MfoZVmKCqIBRJoNCNcrEnG/nVmTjZ6RQb0PAgOLB9neLD3/2SQ
         s2dOZkvVdUj/+6xgzaX4UfGdY/KwyZXd8WCC2uQCGWYSNPZiYuRBlIFDtcAr4JvMyQqm
         BLM3BLwcsIWLEnPwA1Ys7YATgAmmBJcHmwSFhUXckGDyCtnc4rFhsSCWVA5zyGWm9CXc
         kA/HMXfGbwVt+psYUj+wgiU/T6KdZTP2lagg6CodKmOomWWaHFF3oGpP5HSg6t6+DQuI
         I8kQ==
X-Gm-Message-State: APuU4Z+WUL/5x68pXm6iBziLzYZ/Il94q1zwG3fmPtmf0SyvR8ZM7NT6
	e8WPMHNIqJmsA+KrsoVvWvdiyqM2ugcHv7Eintu3KIrl6NfgHeOHq8mnHQWz48Qj
X-Gm-Gg: AZFdTZf04ZYVEEiv9Oz7Eh7fbryKhsXlDVF57q8xn9H5AIFPXXwK2qOuCjE0wR3bBIY
	UU0PMAzUVQ5sPWUNqg3eFpFoXwI1WlLho3UAOdmmvu7xB9Wj1/BBY/420AsUkVZRaDx4ku6e1MZ
	jqYSPVPO0aDkzC7Bjz72AL2FO5DqpWM932aWoTBkx5q15I5KmbNsCxXf0DJkeuhcifx2vbvxa6p
	erkbn2PEY9s4QCek1wrVuFzxhQ7Y5m15BYMzzk2eQrzBGzDhJOuRItY5hYt+V4V2U8moSZt1B7T
	ygLWYDJw90dtio4mZwz+8qDOHsx9Ho2QmA1kNgHHKeaghqqkTivrYHYHCXgXRQtwB7CXBHSIrgA
	Kr4hsREsHUfJEu0ADJQrfBPszX3H7oTzkS7OKCKN9y346Vown4r6olgVXVyf0XYAI0yG9m0C20o
	L2hkvfRH/KlFGxq8648jIwYGsrzC3SJLPC5q7UgL8HSjIw59eZylR9s8p9QMCFW4b1nn6oNNUpH
	8u/X3QWv8/0ZRuuwCjF+PH6ZPL5lasbPUf5JaJpjePgJNTjyxM0mG/c2OwGPa2hfwllsjImsiiw
	z+1oMat5JJ2qkdkv5kiFy1FNOAYOdMnF9d1yHC03Xr+oMSbk+Eu2
X-Received: by 2002:a17:90b:3f43:b0:3ac:74b3:a8f3 with SMTP id 98e67ed59e1d1-3b41c93541cmr671217a91.44.1795126279845;
        Thu, 19 Nov 2026 14:11:19 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac5:6213:28::4:379])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41d243eb1sm369348a91.3.2026.11.19.14.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 14:11:19 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net v3 0/3] net: dsa: motorcomm: FDB fixup
Date: Fri, 20 Nov 2026 06:10:40 +0800
Message-ID: <20261119221110.1123578-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Various FDB defects. Assisted and verified on the hardware by LLM.

There are more gotchas about multi-bridge setup, but I'd leave that for
net-next since multi-bridge has always been tricky among DSA drivers.

v3:
 - ignore multicast addresses in FDB ops
 - exclude CPU port from leave mask
 - withdraw the following patches
v2: https://lore.kernel.org/r/20261116160107.1351198-1-mmyangfl@gmail.com
 - include the CPU port when rewriting FDB entry
 - read the port PVID instead of bridge's
 - fix PVID when port joining/leaving bridge
v1: https://lore.kernel.org/r/20261111234110.1449602-1-mmyangfl@gmail.com

David Yang (3):
  net: dsa: motorcomm: Ignore multicast addresses in FDB ops
  net: dsa: motorcomm: Do not inherit ports from dynamic FDB entries
  net: dsa: motorcomm: Rewrite FDB entry on port migration

 drivers/net/dsa/motorcomm/chip.c | 100 +++++++++++++++++--------------
 1 file changed, 56 insertions(+), 44 deletions(-)

-- 
2.53.0

