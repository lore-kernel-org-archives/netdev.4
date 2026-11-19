Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099375;
	b=Jfde9/xjkqhiryX4bVuY29+NpLGMUGk+1wEVk1SUSZwapZZTe24Vg5DD3ZrXUNTqvklE
	 QR5BRCNuAwzYffbhzyjKjJxSf3G21xaOTxUu4MSjL3QJ2X3+E7FXjMyM1QWy4MZD5Fcvm
	 1fNTM7McaWblskNA2HOdq32tbD47+ZZ2NKp945sgogubOIhyWmQ3tVZpuR88Kfa6MKwC1
	 TkiJRxxrPyWwpGQPu7D1/RbtzyfLGCIt2QdtPhxdQ2q4EuS5fWDY4WVxp87vJpT14IlTr
	 O6SRQ+ynbjbmYXwzVfqR6XHSiH6HmtJzahILayEN767jiAYM2WuCokZ/DmFefuM5XIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099375;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=52+JnzHR7Q9S8eHgTb67S23dwF/n03+ylGtQP9LSPX4=;
	b=vcpwRCntLRIPwK8pXion7fT3h0e2NFNf5mnjxu5G2mhSwyIBBvHeSB+9L1XQFe9hF+A+
	 5jJbYKJqzkM2rb/TCCWfchMszP27S2XiKcQNFR0VSnG+cn33sHF//xyHnPmIfoqw+3GbS
	 i/J2LxmwAaaNbOjlFOK1Ubu/CkH9Eh1R3SgLuqeChKyPustxljDB5+GeqYiCTe8v52Vz+
	 qbdIhfM+cLyfLixTK/mUdvjStlwnGxgMgezmq1C+5Yg023sfq/HRErPqE+nFUrYcvQWCB
	 iDSlsElMzr2fINnm2cvOJdcCx+2CpPoIT8zUmyDEr9mxIYDFwV1oUXGJPnMxNz8M47A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M1G4GBKn;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746A960A263D
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 14:42:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 746A960A263D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M1G4GBKn
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3282db206d3so6149887eec.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 06:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795099375; x=1795704175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=52+JnzHR7Q9S8eHgTb67S23dwF/n03+ylGtQP9LSPX4=;
        b=M1G4GBKnnz8x5UyDeEAaQ7PbQtG7pv+APg53+J8nIDZc9JIvywGhxFKegufqSmm4ud
         oKhn2LLj3rBsRmoTiHCc6Y8wTteldNMdmsrVi8DvLX4Q2mfe5rHrchWuqHSUeXNVf953
         gLiyYcavyQXq7NBaworc16ImcWRkVUFitUdBv2IRtB/V10HKasv7TELTdU0/0pOzdrmb
         p9Kjcf7Mk/4Ib12b2OlZI7LFbomYpCz7C79h7gkK7HUYV0+CFfCNpt0pDSCskqkh2GTz
         CTalF1BdhY3cCTRbdhWSoXea8TviMdNEKQnBeAXznKxGRO+sNem7UgeEC6WV+Mj05n++
         A6Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795099375; x=1795704175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=52+JnzHR7Q9S8eHgTb67S23dwF/n03+ylGtQP9LSPX4=;
        b=Xwhpmw07U/k0Yx/Noq1VuuybNkdZIJHgmf0EpOc1IuqNW5/iFn1mrd5FbfQTYnZ26p
         8LMHQn3YRFSzSoigacvCZWn3uPGzwWxfRXNXec/sblm++ZJ0CPL6C7cbTLXEf2tmahn4
         2ryxQrJiRiJABJxMcFooud4yxhrlC1o7Q4CIerUWHoTv9KmPYhLqEvp3+tRKrqORPb5L
         faj9GbNilIsflzJIDU472jvlvZFMsVxtrVnVJcQnr75cPYjHpaV116hwuZxVcGTCQibU
         EWBUJhuQofFZXa0L7zhyu+7wwuu7Sv8Ut4OWbQgB5NCHECQLZxuek5NwRGDzSuFUrbWP
         LEXQ==
X-Forwarded-Encrypted: i=1; AL+hErFP+UNFKEMIzn+TbCNW7zsINIq9IQ5dCQ1pvZ7omJUblmkE03ywRIe+dgYWrY6J2w+Fq/RnS7A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UEEk2dZRQBOSXCWmODMKNQoxkneO+f0cX9CnNIHxYif0LTkTA
	2hFKShZ6YLmwjQFaivv87/GnjyzKI0wg1cwoQSV9HU+ZTvlbGkrnUk9P
X-Gm-Gg: AZFdTZdkUUYBtZNRjfMSoV+xVzmFbggcCAdWk6Y4NLEJtCz6KJiSbeAcDNpou1aAurW
	xZLEArkaqpl8G7J4iniyHT0FQy4XHl7W8/YA9lEHwOpnnqBMgPsxEsTBWQ7+ToBwpXbVEuCcQDS
	3yjrMPkbIkI564G/3JQ0YB47nUnt2aGC6e3isuRtg37C35xfH4J6NuPWsWyxf6Hr5Vx9ZLIM/2A
	LpDHmq1d2qpafXuxWUSpE422qeUD9Kou2QSj1M2vK3s6knDX/VrjqPCZhI6rNXB8l/qJplHcbXP
	JMp5cRhAwysyVylRJGTJVdgSCIjg9x8zx17aiIQe/0+PYMgLMPtKTVuNJlmsAhl7MfeBHHEJK88
	xoTzzFG9nZa1xTa5b3m0tkqjTlNP5V2VYC/h0ZPLtA1HMH1fQeFP98H+bqF5xwg+5YBycrYrpFo
	+am+joxHRzzbSSifq9YHw6hTP0SSsuHrkraFaah81PvyB6YxIYKSLkaSNFiJSeyfwDbN2H+nAoy
	oEp9flyU2jQ8Aw4GkwBzMlQvHqSNxJeCqe0VF1/KYhCfxWjBHNTSBdg4WpCpQaheIOB0d0lBGnL
	j/VFmriZQAHaWqXKPl2iSaX0nT6qLMQHa5QvRK9h3y6Is1Souw==
X-Received: by 2002:a05:7300:271e:b0:369:4c3f:8a5 with SMTP id 5a478bee46e88-3827fe755c8mr6031110eec.14.1795099374635;
        Thu, 19 Nov 2026 06:42:54 -0800 (PST)
Received: from localhost.localdomain ([112.170.44.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6fe733dsm16682848eec.16.2026.11.19.06.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:42:54 -0800 (PST)
From: Junyoung Jang <graypanda.inzag@gmail.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowangio@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Junyoung Jang <graypanda.inzag@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Gwanhyun Lee <gwanhyunlee@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v3 1/4] net: tun_vnet: validate hdr_len after skipping header padding
Date: Thu, 19 Nov 2026 23:42:36 +0900
Message-ID: <20261119144241.360238-2-graypanda.inzag@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119144241.360238-1-graypanda.inzag@gmail.com>
References: <20261119144241.360238-1-graypanda.inzag@gmail.com>
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

__tun_vnet_hdr_get() checks hdr_len against iov_iter_count(from) before
advancing past the configured virtio header padding. With a 512-byte
header and a 14-byte Ethernet frame, hdr_len=256 passes because the
iterator still includes header padding. After the advance, only
14 bytes remain. tun_get_user() and tap_get_user() can then reserve a
linear skb area larger than the frame and transmit uncopied bytes.

Advance past the padding before comparing hdr_len with the remaining
payload. Both callers return immediately on error and discard their
iterator, so the cursor position on -EINVAL is not observable by them.

The problem was identified during review of the tap zero-copy fix and
reproduced with vhost-net in an x86-64 QEMU guest: a 14-byte input
produced a 256-byte frame on both tun and tap. After the change, both
drivers reject that input with -EINVAL. The new tun and tap selftests
pass on the patched kernel.

Suggested-by: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Fixes: 2506251e81d1 ("tun: Decouple vnet handling")
Fixes: 6a53fc5a8770 ("tap: Use tun's vnet-related code")
Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>
---
 drivers/net/tun_vnet.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/tun_vnet.h b/drivers/net/tun_vnet.h
index f4c652b1fa44..0b9622891681 100644
--- a/drivers/net/tun_vnet.h
+++ b/drivers/net/tun_vnet.h
@@ -138,11 +138,10 @@ static inline int __tun_vnet_hdr_get(int sz, unsigned int flags,
 		hdr->hdr_len = cpu_to_tun_vnet16(flags, hdr_len);
 	}
 
+	iov_iter_advance(from, sz - parsed_size);
 	if (hdr_len > iov_iter_count(from))
 		return -EINVAL;
 
-	iov_iter_advance(from, sz - parsed_size);
-
 	return hdr_len;
 }
 
-- 
2.43.0

