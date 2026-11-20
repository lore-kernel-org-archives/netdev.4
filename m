Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182387;
	b=O43eG1fTJCY/+yHOxXA0YUKm3jRtdzPFTJpm7y8rRih9osU6338yQ7NpF6Q4n9C+1tOO
	 SBVe2cx5Tsh7/d3PmGsVf/p3Xt7Xc+luKrInFILn85Cy0DPlVKnIpH5hHs8a+YzVq+TL9
	 ww9lycmChpIUFb3LEQIEVL2Ogx0zFQTUyyHSRN965dUhYcBmQ5LMGvFJOeBOdlqNoplRh
	 X4aNFYcDUZ/NMPEcArpJUxMIEq3z/EWW+ODzAxAPCypkF4bniUVJW17vCuibiVpzsMh6I
	 hG9epMD5IUHnf/1IYPozYulkUcY4fYBWMkIWbs7832p8JMkHLN18idvU7MaFGAJqzlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182387;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=f9dmpvT+qGSbxrdWR6z/QLtIEnkFsfPUirMgFoiDyuk=;
	b=NOhqb1W8rywr201GLPUu595j13ALE7As+DCxg9BRmDa/edr80Wq5k8eck+KpE9USAwxM
	 BEKDaIbF5/AGFtBegun4oFejuAJPvyBkq3XCY8Mgs2Bm/ZZOBNH1K4iIktQCDuVz4NjS/
	 8yzYilXYf5fNRD5PkmH4pecq64FqlhTToWsR9sGYTEW8z773cBtRxgD/QuFdlF51+8LM0
	 MQztxE7lYM6uo/3WzTJ9faI9muQsFBy0uKs3UJFn1G3R8azSrRL5BGRnSqjnu0xDceprA
	 n7Q1ma8C3ueahFN4bz242Eh0B56JGvAfw3CKWS6AxJDtDMQmJZNpFroKw2cL2zMv57w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=As8pCkrk;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97104606A325
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 13:46:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97104606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=As8pCkrk
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-14394530ec6so1394777c88.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 05:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795182385; x=1795787185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f9dmpvT+qGSbxrdWR6z/QLtIEnkFsfPUirMgFoiDyuk=;
        b=As8pCkrkrP3CcZzzIlX1BH313dGvNRI01ybB/haE/GylyaSBv5DLH31PPEhivtLEaQ
         I7BPTlugs1M5cyfHbnakysQZ7Y6o3FNHwp86MMquM1LbPrXK7gZkpUWpf4ydqLreXrpt
         PykTR9AlJMF7Vk+4YDmWL+N05C5W3xrt1NYqEfyaDVo5xMHFl51BaKEMFmyKorYVKRBu
         ydt7NCz4mOJt/VACEJ2e+zAUGGGbPxBqGl4HKnei+8ikt+He1sdpuNDMIyURotl0P2YM
         zcUXOU5s6rSXxVjcIE90SXrGu5gtwgiWH3ILNUPvypE1eauUBIu56O5qLW4BGcUpshY/
         yh0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182385; x=1795787185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f9dmpvT+qGSbxrdWR6z/QLtIEnkFsfPUirMgFoiDyuk=;
        b=oB8T9gHciNIbCtWg+PVy49QSfviLRkiN/vah7T9IRe0P/z2VtvaEVoTibdPEr5VeCT
         qBNIhPp67UBjmZ28PFZDqeeCkRkV+jDKya7B7MzPx5jvA/rrVtmBD9UFYn2zk6Gw8/nu
         z6JcQPnLFrVqjJqItwJ/TYW6A/0BteMlywyBHMPbYp/gODA/3D3nFYW8tR6QrMzrkMlX
         TpunD1LY97xK+jDRxSrU9SdMfx0WYV3CSDLdIbHDYisTmNPw6FioqkE0HBdm508oetaC
         Nxl0l2lBzAJqByJDtMo9ZVvrz/xWUXKzYicuz9TEyOx8ioJzhqXDQCDqT00yyTpoCnFc
         x8fg==
X-Gm-Message-State: APuU4Z/n6vf6yYUCBzXAf1DO9wvaTWfwhhw2OjFUarSm3nYpO3/URfbU
	fenyeyc/g+C58JK/KnyfbWa25ozC8x9pcpFAYCia/UMxmxfd9mccZEOu
X-Gm-Gg: AYBFou1LkpBjSSOxoZqaUJ04KmsGGGuvO4cvJ5kynrjfp4S0T4/GNXTJsSf35NNUayD
	JVOvulkdAblNK+gpsUg+wYIDBmdAJkQmNUOUzVw4gIW+4dpHqaS9LsULu77xncFdB/g2V0aAyL8
	+Dw+gccVXp6Ncilj9SrJO0FKgwpxKZvsMjj9YbHSknNJSxw9OKFtiQwff7YACZN7OH9ccMQ1Ooq
	UFhVgvaT1F9fhsy7AmRWTkWS42hsprQ+2+7UtukyPqVr/HBZULqdVyjhORJ+g2aqWs3LZbfcj/q
	G+UOpnEdFS7f6ZqCxCQWDg7iRJjhDnfxvquai//aNrLPmLAj5vHG5bok072r+jaX3a58niQPrpf
	teQV7JihRxcRIT7lTT1M3eWa5By2YndalmBzw2P6VIoAVuPTUTXMLBYNTflp+9itNJw/Y1tyEKv
	XdwdJSqT/BZunzrJ2O9mlHMDqsGc49JeqqZUYBKzUQ5wC/pu91zI0lB4vtVWt3sHLC1VaIMJIBX
	2TELKpERqQqvH08kmycJEfNg1Cnrk0muowhrwk+6YpYowdYHcMzvQOAaeA4pLTTM/kE5dvBEmI/
	iI3Y979C7WgsVFoiBFCsUrIlxyH9
X-Received: by 2002:a05:701b:4648:b0:149:1feb:6da4 with SMTP id a92af1059eb24-1b5568f12a5mr2488247c88.32.1795182385283;
        Fri, 20 Nov 2026 05:46:25 -0800 (PST)
Received: from ubuntu.. ([2405:201:8026:213e:2204:d735:8fdb:7bc2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm13154456c88.9.2026.11.20.05.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:46:24 -0800 (PST)
From: mdshahid03@gmail.com
To: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH] rtnetlink: fix NULL pointer dereference in rtnl_get_link()
Date: Fri, 20 Nov 2026 19:15:48 +0530
Message-ID: <20261120134548.214126-1-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Mohammad Shahid <mdshahid03@gmail.com>

The rtnl_get_link() function falls back to the PF_UNSPEC
handler table when no handler table is registered for the
requested protocol.

However, the fallback table can also be NULL,for example
after rtnl_unregister_all(PF_UNSPEC) clears it.

In that cass, dereferencing tab[msgtyp] results in a NULL
pointer dereference.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 net/core/rtnetlink.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/core/rtnetlink.c b/net/core/rtnetlink.c
index e141340172ce..b552cbf17d76 100644
--- a/net/core/rtnetlink.c
+++ b/net/core/rtnetlink.c
@@ -406,6 +406,9 @@ static struct rtnl_link *rtnl_get_link(int protocol, int msgtype)
 	if (!tab)
 		tab = rcu_dereference_rtnl(rtnl_msg_handlers[PF_UNSPEC]);
 
+	if (!tab)
+		return NULL;
+
 	return rcu_dereference_rtnl(tab[msgtype]);
 }
 
-- 
2.43.0

