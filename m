Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794796868;
	b=lb1CTR4YxXInAxAustb98gEQ+ctxwfjzaH3fN620kK8qoOjyLJI/2oLDrS4PKycoJjDq
	 UPkPvmElwc9dkrivYo0Lc70B6UP7ffiLmk53WdpwFahm9666HSydOAmKPjbzefxgMTZ4c
	 N8hE7Zti0vL3Dx85NqeRest+TtWKyAG2leDZ1oGBXBtcxBo2JNC6erlk4IqqKS41qRDrX
	 dFY6EXRNflPVKjkF0/K/e+fUmZdBQgfe04NPw2WAnHPagtpdLuB0eVqE7Od5XDWpxIvp+
	 VmOfzD1FAP5e8iFu5Fjsa7F0IPwpu3MFhBx2IFedz9MLS37WSO3lH639RlSpZSnoWqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794796868;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=V2OEn9tAKSN4sXOsuonmkzU2ywS3aimW3cs+6O3cqU0=;
	b=xEP9NPhy11WjE8jTqS6/hmMfF2zZMhM8sYwpQ0X5NLGz4LcbEPaTE31/rbjkNW66zcaj
	 GhvLpR8yt0WuT4+R5KjbYlDCdQaM03KAbBhF7S3P/8UP8OBXxi+s4gkWkAxvCA9fr8e7G
	 G+bDfIYdajLAuROMOStMkQkEZfnlovW8u7kvj+P53afd8z7+BK1FVnLkpQxjHrqsNKoMd
	 DhWrLXYSR92sKD2dPE3/k9CZXWGpTjYHFOlQNGVTBxRk62hyabnEEf2DD5OSQzbKDBHeD
	 FcnTdHsJx7Y3k8bK6Z3XlRkcrqUnVlnUWQ1TAwwIvPoY/NrwAnwOWfCCby/uUVW/b5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fu067Wwl;
	arc=none smtp.remote-ip=74.125.231.130
Received: from mail-oo2-f2.google.com (mail-oo2-f2.google.com [74.125.231.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971FA606A321
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 02:41:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 971FA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fu067Wwl
Received: by mail-oo2-f2.google.com with SMTP id 46e09a7af769-862a00144f1so513942a34.0
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 18:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794796866; x=1795401666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V2OEn9tAKSN4sXOsuonmkzU2ywS3aimW3cs+6O3cqU0=;
        b=Fu067WwlnNSDgeNFNMmXlAGr3qWf+wNIlIjF2/UUs3AZ8BqwuTRFwaVLXHoMHoitjQ
         OmMHs8QjjIG/z7o5xJVKWU6KoZem/ZW4M6O4f/pOFff6k/kSbzm5+xMc+P5DgKzp2lrM
         5xzY81eA0Pm0GWb57FNA/P65VmrDZkBmNaYBlCvhxUNUg4+9DfHuBCXEXJBWMSW7WYxL
         2ZYuG+Txsf8zqwIpFd2WHnpd6YvQeh2EmkTDGvRGAFWhNRqeeZeFemYypUfXgNV4vsP7
         CVq6WOVQ0m08vDz+xoOssyE3rQms0RWtsbprbqw91wGuEUVfBfVNwbZVYCFYdypjrAPx
         v0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794796866; x=1795401666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V2OEn9tAKSN4sXOsuonmkzU2ywS3aimW3cs+6O3cqU0=;
        b=rz42ErLpxTBG73GheZ8WIf75CbbZVr19Iac5ZJrEXkct1q2RcJPobWVmVKRwGezur1
         croJe4U1NQ43XF32iGBjijs8fhQpoZNjliTeaPveucfx29xeA91Osz7UzSYoRzDT4Sot
         fWIwuLg5hI0xacDEGPNXky8FRDIqoz5dGRJ1STknqU7JjjFHv2PtUky8xnZUhMSwPBAQ
         9JwRkJKNkLQuhLhzU2tby0wAVaWWayVQk/a3RysXecYXQJ7Ahuhgu6ZJlkSW2uXgjEUz
         /LStGBaNJaaHh3vgpb1M01MrEkNuhxvCCpkEBl3cJpnB+OmACjbiubIaKtI6yO5VnXSE
         zwXw==
X-Gm-Message-State: APuU4Z+Vmv/7xq7KcY5zeA288n7ZSfGL5CiWeYqE7B0IKNI2MapNafb/
	Gj6ohzWTcjeQ6kejZtDU16HyNt8+OPlxENRkMFMG35HC0JGRCylKrToH
X-Gm-Gg: AYBFou1v4rqM7YdKTnZYxlFtoGQEREsecdtFiIsZthH8951sE5O7ye+FJnw/RPukp7G
	ApJiK9RJ3K1bqkwZbLewg5N0PBgdPp5CiVZgvKgQnppY8N2d+196wTxjlCONt2Xk5eVwcWcjH6x
	XvRF5/mhJN+eOtUqoUfpOHAg0/WYjBuRTwmpLWID8eRKTse2ScYydljNXMyOkZIG50W37qLHdLM
	OAJY0JGSFpzCSogeBPulxWeQpwy/5UHqHaJtRJXbhN3BDu3hnQNAoV5r6vxFp/4VlW/KYzuGWOr
	OZJTGw/9XuvpnlIJEOZAgdCNDeBhckcxrsRBGfVYmraqRAwf2Nbqb++KU6ogEBekWcCOA+vNzl4
	2KKSjtPrj7ylvzpwEaaNejMFGa3UIvrDRdP32kjm6iuaRacSx+kkiNBQUXFwYa2NmvOCb5Gemx0
	3ZqCoc3/ivFnDAG0Yb+fyVJTkPcOj7GvMU2W7F5no2DhQtwaNg9lRMmgfWnMdTSc/U3/EFWeQCI
	jljrVRhxTqJJEf/8WyXs5A2yLP6PEOY7zrE9xIlX1bn+kSY1KwDtcfup1SAiZPxLcmDaPVgZE8W
	w+hmQVtX69OsK5aXOxfyTP++lyQ/GZIROPLeeOXPuKReHEBjKhU2x+NN4L/qo1KBuSs=
X-Received: by 2002:a05:6830:a21b:10b0:81c:a6c8:8a65 with SMTP id 46e09a7af769-86289905565mr5197772a34.25.1794796866535;
        Sun, 15 Nov 2026 18:41:06 -0800 (PST)
Received: from localhost.localdomain ([14.22.11.162])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862a82c4625sm5441937a34.22.2026.11.15.18.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 18:41:04 -0800 (PST)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: Paolo Abeni <pabeni@redhat.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf.kernel@gmail.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	Yuyang Huang <sigefriedhyy@gmail.com>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] net: fix uninitialized heap leak in multicast address dumps
Date: Mon, 16 Nov 2026 10:40:56 +0800
Message-ID: <20261116024056.1274402-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.43.7
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

__hw_addr_create() allocates entries with kmalloc() and initializes
only addr_len bytes of ha->addr. Dump paths emit entries using the
current dev->addr_len, which can grow after the entry was created:
tun's TUNSETLINK changes a device from ARPHRD_NONE (addr_len 0) to
ARPHRD_IP6GRE (addr_len 16). Both the RTM_GETMULTICAST dump and
/proc/net/dev_mcast then emit up to 16 bytes of never-written slab
memory per entry.

This discloses leftover kernel heap contents to anyone reading those
interfaces.

Zero the tail of ha->addr at creation time, so dumps can only emit
initialized bytes.

Cc: stable@vger.kernel.org
Fixes: a748ee242681 ("net: move address list functions to a separate file")
Link: https://lists.openwall.net/linux-kernel/2026/09/10/320
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 net/core/dev_addr_lists.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/core/dev_addr_lists.c b/net/core/dev_addr_lists.c
index d827cc21867b..53a2dfa2706c 100644
--- a/net/core/dev_addr_lists.c
+++ b/net/core/dev_addr_lists.c
@@ -100,6 +100,11 @@ __hw_addr_create(const unsigned char *addr, int addr_len,
 	if (!ha)
 		return NULL;
 	memcpy(ha->addr, addr, addr_len);
+	/* Entries are dumped with the current dev->addr_len, which can grow
+	 * after creation (e.g. tun TUNSETLINK), so never leave the tail
+	 * uninitialized.
+	 */
+	memset(ha->addr + addr_len, 0, MAX_ADDR_LEN - addr_len);
 	ha->type = addr_type;
 	ha->refcount = 1;
 	ha->global_use = global;
-- 
2.43.7

