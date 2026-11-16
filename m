Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794844927;
	b=17lscHfBnKwB6BFsb03IBpXLs7Fzht6BBtGZeR38KOZQhCROktLHtsaNbBEqNGLqsGIp
	 LWNio+CC3QUlo/wDZA/t7BhSPEtwqosZitrn9H7URmdJg+NVxZtsvtABz6m0XuSRYWMuo
	 A6Szy2HgSGZZl7ZlYv9O0XsXYqf5vWtivfUbq1SNpFzK28JyWHaV5FbvCnjvaG4ACipu+
	 x8m3Ol/Q4qBnmt5IDYsLLla5aVZaPFhbdh9wr9Ozzh18vfGkxGSjBIrPtxjN0fa5BADsr
	 ONVLnC4SbWG/jKMNhTjH1wRNvNIe4Css/mN7J7dAq+02eYbVK1p7APc76B8tvkMVgpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qS6R+qjf99PqrLSAZdR5V0+IKAMGWZ2eov4UlAnYxRw=;
	b=Iip95WV0tVVa8TvNr+eCm7ZaylusNp834KeOUy8V8O4J/MehoW30zqcLp175Le20L3iq
	 Aza+lFGc6wagG7btWJzS0KvHsmZXpjxsyvp4tZdJbOidpcgPyF7ZxmdftKufRVR3N1CeA
	 p3+IOTREdUL33PjFMBTfkYVUMg1B47E35qQSkO0gJUfFLRzBzA0FKDTe7dRZCTbPLsOgI
	 Rq14sKKnNC5egWmsvCFND989v78D2X8odJJxs4cwoPKYjUz1dB2VallhfdpntvJYLu90F
	 Rt6H3sdV8YyMVAe0U32kLWW/4IJX1vYARD/6meopR/MmW0eXAN7ih1hchdiKb+LJAaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CJbgHL9R;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90E8606A883
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 16:02:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B90E8606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CJbgHL9R
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b10ca4e3f9so1861865a91.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 08:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794844926; x=1795449726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qS6R+qjf99PqrLSAZdR5V0+IKAMGWZ2eov4UlAnYxRw=;
        b=CJbgHL9RjlVBpSHuBju7KGcw4Lm8j8lMjyRQZIC77SCi2ZQioI7OJbCxp66LQg1mT9
         6rLTDW9dwtBgorUtgk6ImczS69hg7pzJNHcyntCHbKih9SB7QXSZF3iyeopmklAxwoG6
         CJQSn6TDBDWc5GPFA/PQYpwlpc8IKucVyfOsYJXHB0GevzsWDWQoFQ5nrPtTPcpsOHe2
         p3MvFMB21wNyvxA5o+EPj7mkdyj0fbwkISqb4SuyuEAr3lMtL1ciGNGpTdQprnrC1HXa
         30KpMc6Hbjh2JQG5Y/7NfQH6fa6e2sjOQfF/1vdaGTsG87oXbMq4ibaKyGSEP3MdkTwT
         UHEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794844926; x=1795449726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qS6R+qjf99PqrLSAZdR5V0+IKAMGWZ2eov4UlAnYxRw=;
        b=wFnVGwdMWmWQaeSiI+xp3rmys3TCMU2vG3emEiB7CfHBLS6ADtPvcLndITP90LJfnd
         ZfkHaCS/8mmYH5uzmqzPDrQ5zMTO7XqyKn9kKwKdOS+zDY5MAWFaxT2Cjea/omfC8oCS
         AKRqsg//hhR79oUrmj7yRYtVZf1SFYq708fPHwQUDv/ouDyVah6+5R/okz5Vael4tzgz
         m81wEN1Epy6SBk8JpyqyX/8IVYQT6QI7cuYwD4tYGByBnMojNRnHEGtEeqvfFeUnaezz
         5UNFD9A2itFm9OK5RSWojYCFo5wEhHY0qQpTuLc9JCfhE4TdgOiF+q8G3T08VCntyJo4
         FLMA==
X-Gm-Message-State: APuU4Z+gL/fc14p1b0EvDvzuPaQ/VaQyA/2ID0ii/+tXvm1YSbIl7Be+
	FqEGITeiOE2UvkX9VxJhhOweWVQPGunSMXQkxrd1sBVCYw++gN3ZKpsgEMAOIg==
X-Gm-Gg: AZFdTZfnJWxbbxIV1Hyegml1zXYRRSv557kaTRcbvHZZbR7OP9DPa+0CiPoziFX1B5c
	xJNzSwWAcIGv/3e24XGOmQ5WoBity+go1bx1flW9gwW1c1QopLiy7qc6qWDJEqeDoQjh1Y/YW9U
	/ggqL6co++pu2oEN3smh/ex6K+bva51+qLBltuPykq121Yml81XE+GjjwYUkzvpWjEC57lPjfIx
	34+BVd4BNNewY6wTA7OJJ3ofJKMNouthJOGbg7RP5AzJyYA0QTYGC07+6Frg0uH7D3W9h7cjddw
	FOBxaVa/x6D47THNDx35m6FwNi+IYRv8SkIc657g8fVRkcatPHHndBjzejUh58bw636bQAk0Z0b
	0warndbq9FtP/X6U/s+yYcwkBzxmSVi+ltxihbuh6+vIUWYIQJUj3trBvUlnZJ1DALJGpHREqVH
	qx+JcuABQTmTrRyaipRd9b/7CnIX30ddnAKSN5q8QFP3mQydzqf9I68q3hUsG2EjAf9I9Kumf2B
	m4jLQvNdlOjXJI96SJ18dAcW/jp9cHexlXJIXNxnjtXyZrp30orBUGOomchFbRgT4RDGIzWEJp9
	Lfqy9h+8eMrihs86raTglLfrvxktOAmim2zAvnnLVmGz4yqVvcNySA==
X-Received: by 2002:a17:90b:1846:b0:3b0:9cc6:62ba with SMTP id 98e67ed59e1d1-3b1b0a3ebb2mr9480447a91.38.1794844925609;
        Mon, 16 Nov 2026 08:02:05 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:28::1d2:6e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1ae98151dsm17432051a91.2.2026.11.16.08.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:02:05 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 1/4] net: dsa: motorcomm: Do not inherit ports from dynamic FDB entries
Date: Tue, 17 Nov 2026 00:01:01 +0800
Message-ID: <20261116160107.1351198-2-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116160107.1351198-1-mmyangfl@gmail.com>
References: <20261116160107.1351198-1-mmyangfl@gmail.com>
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

When adding an fdb/mdb entry whose (address, VID) key already exists in
hardware, the existing egress ports were silently merged into the new
static entry. Ports learned by hardware are untracked by DSA and can
never be deleted. Replace the port mask instead of merging when the
existing entry is not static.

Fixes: 186623f4aa72 ("net: dsa: yt921x: Add support for Motorcomm YT921x")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index c753c746490a..c6d0f000a163 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -799,7 +799,10 @@ yt921x_fdb_join(struct yt921x_priv *priv, const unsigned char *addr, u16 vid,
 
 	ctrl1 = val1 & ~YT921X_FDB_IO1_STATUS_M;
 	ctrl1 |= YT921X_FDB_IO1_STATUS_STATIC;
-	ctrl2 = val2 | YT921X_FDB_IO2_EGR_PORTS(ports_mask);
+	ctrl2 = val2;
+	if (ctrl1 != val1)
+		ctrl2 &= ~YT921X_FDB_IO2_EGR_PORTS_M;
+	ctrl2 |= YT921X_FDB_IO2_EGR_PORTS(ports_mask);
 	if (ctrl1 == val1 && ctrl2 == val2)
 		return 0;
 
-- 
2.53.0

