Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795599445;
	b=qkB6oC7asdPhPgU+mcBCCQJ9H673tOCDasdys74qxyOaJ+hDYp3ytkGXBp0xziFj1/Tc
	 tKypqHGETd1O3dgPK58bk2H5BmxyMDrK4C86Qv7VmmTPuY41bIfjQYM2P18UeihQCbKDC
	 ytK/uHNOFBoJBHfOkNvnHg0LhBiM+orJM3mnRENnPMz1UFqwEjO7njmkeN8MpzqImlJ7M
	 VepkBxyNgOD5oYgpoRgP2iAl2ekGN+uTT4kF5kXq2spEJ3SS0Uh9juJye1vKyhWL7wE+o
	 JbscPgPuTpmVetMGDy6Ml8Rt7HV5I1AvxmxiS2zbjIDdemyyybUVGeiRF2sE/xLBApQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795599445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Uru4uc89gdbKTgL7oPQD/8sChQuJekgJ1PKHJDsBnDk=;
	b=UkRM5+Fq3Ss4naW21xhwacWoiV7q3xKeIeWfo9bvzjRnxb62+JF+LdBTUrmadVCJfd3N
	 IK7hCPVkqp0BABCGX0ZzpDXp2fd3BCEq+UenkS8UcyYJZB3HpN+w0VhXEtHD7gI97EU65
	 tmMNlq7BpoY/FKpoRLJzu+ElRcq2dg7BgTC4szpxVxEtiAtw5Q/d72XI+4jX5Ax7Lg4mZ
	 jyQdBw6X5V7EXwCMYk9gpTU7BGLMcI1RpAw1hvT2+MRhplHbSupj9FJV/rtFpMP7GnHBd
	 3Gbk05t9Mv2yDbM7dlDX+eJTx0oJIV5Vtab8LOjnKCnysoTgD7EPWra8q9gI7s8WhMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z0dLjg41;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8544606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 09:37:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8544606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z0dLjg41
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so58910235e9.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 01:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795599443; x=1796204243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uru4uc89gdbKTgL7oPQD/8sChQuJekgJ1PKHJDsBnDk=;
        b=z0dLjg41R3uLk2yeb8k5wxIB6q0Ke/05wkhEoBVYgl+hRx6El5jMIq6grFlpzdFuon
         qF5yUr6pJs5UwqLBK1T8XZ5EoxNpDB9jO28H70rVYGQKIA2VZwvuONhWDs2ceMcoDWgt
         j75aSwOvJWVHlSNd/0UZPtBRyOyubmhYJmAI7CHV+tuSN1HMki1uhpJwRo6IPN8GCR3J
         OZq5nSUUWtaQ0wGfWsPBhFgGHYwz5YQdCkOSLYWDe2SES1Yi53sMnk24AOKsJeEL6IYR
         NWDNhh8/c6LAHuZaTmPQBf4g13zU5LCGWjVQmbsozJyC/XkJ1UuP5SKQr3ZGLZ8N5NAE
         dUlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795599443; x=1796204243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uru4uc89gdbKTgL7oPQD/8sChQuJekgJ1PKHJDsBnDk=;
        b=wsNHsXktAe1Yg0uqqxULvVx850WKgHAAib9BYat8O9Bn3OYvgkRCSY2raO93CBBT5L
         JWVFQUGWhAWi8CWb7aya56ztqqCwpoVXTRw6DMS9AQ8I59fewBK7trlRPovBYr/P6nLN
         nZhLegmc9lCYcrViMcvseHqY77uCX+Osb9FWc7dgsZW7/8eqIi4JE3TQOCgPYU8KKmha
         dKzW4QYxWDVhImH+ziNmfRWojdvBIb7LBtcwFcL5Y3ckDBTmmfWR454NuGrmaTKftujH
         MIrr31WD+QukyYRFYXVbszufzc77suND+szSDCRfmd+FQMYvPhRpxvDroXzj1aAc1I+s
         pb7A==
X-Forwarded-Encrypted: i=1; AL+hErFwGE8YifXzG76n2FIQ/VJMZuhQvJvIxibmVG+lb9e4db/sDBEdQEbPjPJEvFD2mo2BC3QlsVQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nCYM1VGL6cWq+/429sVjS4MCK0vlmiTsZmFuAz8yqd7hCID+9
	6NlxavWakIRODxPubg7xoD95ECkeA8k4XmH6MhbYRAAK7bdoTHt974xb
X-Gm-Gg: AZFdTZc8wCCn2bIRNKtg1w5k98rNk3iEJ6EID06XaIes5T75hRChFKsAJugf5w+uPkW
	3zdlHcPamtB5FuOAOjvFHYvuR9HP2DJQx8ng9iflD09Sagf57iKdlOZaSSltoF4VSsADyxBWBaK
	Ja0tEbhMNEyI3PYM8N3nj61hRm6C1QlUtD5ScfTiPR3nw4rnYBZm26FR5VLJYfBCObbBYzfNv00
	WA7a44AYgRzW2CBhf1ZH/7v8Iw1LFIIMR4Fk+bMbM5aDlsvXAIO9yEX0vOrJ1IS2M7mai1e2VZp
	/LW6guuk35H51AOTD8ChTiOuUXpkVui07pqSoyII46ydgxwv5QftQKVy+CjQrdtAB4YrHT+bNIK
	gBdP7r/BxPdnuWMwtF/+Uu6CFXgXmQYpXx9JvDFn0yRlRwz4jKsykonSBEXyqTqwfRPaKNGB2z2
	ffAlI4pb6u8kSBwzOpQ2Tigv2jcIgM9eu3Mc/a+UyZjtQW7hm771aqF5qc13H3GtQCL/SLTkiMS
	JWsuJ0ppuUVC8tUeYl0Opq2jfuKsmA6eLKCHvTKC3yDIq+oxjyi6f9tOvWqJOahjk5PG/JPHkfF
	8RNy2fh9NKBNdp3DrYl8syvh/6I09mQWvtzH0a48Zg==
X-Received: by 2002:a05:600c:6092:b0:4bb:6ac0:6dc0 with SMTP id 5b1f17b1804b1-4bb8892097fmr322215805e9.29.1795599442922;
        Wed, 25 Nov 2026 01:37:22 -0800 (PST)
Received: from fedora ([5.131.7.59])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm492567075e9.10.2026.11.25.01.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 01:37:22 -0800 (PST)
From: Petr Vaganov <petrvaganoff@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Petr Vaganov <petrvaganoff@gmail.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-bluetooth@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Subject: [PATCH 6.6] Bluetooth: hci_core: Fix not checking skb length on hci_scodata_packet
Date: Wed, 25 Nov 2026 16:37:07 +0700
Message-ID: <20261125093708.227125-1-petrvaganoff@gmail.com>
X-Mailer: git-send-email 2.55.0
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

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

commit 59437cbb5781227567dec226aaa88c66a09ccc5a upstream.

This fixes not checking if skb really contains an SCO header otherwise
the code may attempt to access some uninitilized/invalid memory past the
valid skb->data.

Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
[ Petr: add Fixes tag ]
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Petr Vaganov <petrvaganoff@gmail.com>
---
 net/bluetooth/hci_core.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index 84d9a445e08d..67a13dca41bb 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -3838,18 +3838,22 @@ static void hci_acldata_packet(struct hci_dev *hdev, struct sk_buff *skb)
 /* SCO data packet */
 static void hci_scodata_packet(struct hci_dev *hdev, struct sk_buff *skb)
 {
-	struct hci_sco_hdr *hdr = (void *) skb->data;
+	struct hci_sco_hdr *hdr;
 	struct hci_conn *conn;
 	__u16 handle, flags;
 
-	skb_pull(skb, HCI_SCO_HDR_SIZE);
+	hdr = skb_pull_data(skb, sizeof(*hdr));
+	if (!hdr) {
+		bt_dev_err(hdev, "SCO packet too small");
+		goto drop;
+	}
 
 	handle = __le16_to_cpu(hdr->handle);
 	flags  = hci_flags(handle);
 	handle = hci_handle(handle);
 
-	BT_DBG("%s len %d handle 0x%4.4x flags 0x%4.4x", hdev->name, skb->len,
-	       handle, flags);
+	bt_dev_dbg(hdev, "len %d handle 0x%4.4x flags 0x%4.4x", skb->len,
+		   handle, flags);
 
 	hdev->stat.sco_rx++;
 
@@ -3867,6 +3871,7 @@ static void hci_scodata_packet(struct hci_dev *hdev, struct sk_buff *skb)
 				       handle);
 	}
 
+drop:
 	kfree_skb(skb);
 }
 
-- 
2.55.0

