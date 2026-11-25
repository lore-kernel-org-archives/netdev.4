Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795599196;
	b=PxQydSdEedJhXlnxoiIadPl2gqeMXCPHsSk3ldyaCAfi58mOrNipUbl5e0bwQ+WzcB3t
	 UEQV2bx3dTv/m5IFtRg1zmQB6p15zlyUSl1upsRNvmg2627fhEgJMeLPctzqsCHIFQhSR
	 9D5cA/x8WC/x5FePv4gPmjAfJ5LOltklHzu49SIJ1pfctrAFpfs6P0/5XetK0svS6zuSa
	 3vRpM3LWoibIaOQYC/XPcAuaQ62rgzQwSfm0qBpdlxe9K1Q+B17SJA8NIRmCvG9uA0XpT
	 7tF8voLg4g0yi8xcArSLTQx3MBir7eri11BeqmK2blyMHZQk9+hUYtUqjD2fBd5DvZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795599196;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FSmYL94CLAH42+p2nURarn8jPDSqfDJDEGZWaM+zzZk=;
	b=v8Huvh+2BfcrcZMgvZ+HFskR5rcvoT2/2uvxViF7LqOWfTSGxkoPZyzsdMae9NgEmKpp
	 zBdpD/CWjcYwR1notDsm/q3dz1METkp2oENoBvHIOz7geGONxztswIDx4oUbkuly2z9ZL
	 u/WjfR2SalF/sSl7BAIqjH4CraFcbDocXBc1F9H1vJixon3mfVuCZYmh+DN/Kgw3KRQkJ
	 Kij3mhJtW98X3Z4uxsxSwiX48eeWBFnvVamGwC0sVdiB6K+osBJBb5rC330GBiKewM90Q
	 jp5uFjptcLrcgKMZuWIXte/LuYJRUyJvpYMZEVS43+i1ZW0E6OMDvdCE8PS/hbMNXrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="t+jv/z5h";
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FD8606A321
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 09:33:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22FD8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t+jv/z5h
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-491846221ffso4710080f8f.3
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 01:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795599194; x=1796203994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FSmYL94CLAH42+p2nURarn8jPDSqfDJDEGZWaM+zzZk=;
        b=t+jv/z5hjGeEZm/mbVnKGhsbkhkJJWeN8VnCFyULn7VO4KiVYiknQKEAtQ8MsVmYf8
         LKvx/zvmxcc21se1l+Wa9RJLJFBNW117WZ4wfoKsn5OH5xoVeJKZs5TC5ThbYb9vRwUe
         rBV8Njv/LcIDpW/kBFSl60hriN9wJCmov81Eejzr8mVtlDL4I8n9hnJECpQ6dVk7Gu68
         doyBYGFzRrL4NCp/QaVBrtM75SP7fZo+GWRCWjr66yv6meracAZe3ebRVg95IqQru9tI
         GNL0uj/OG+xDvfjUdPt6eXAOjG0Q9eNUGVizx+bnpv/A67Ch+WOYm8Ocm6jd++GL3hl4
         eK1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795599194; x=1796203994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FSmYL94CLAH42+p2nURarn8jPDSqfDJDEGZWaM+zzZk=;
        b=toXm51HfL5tmGXEAjb35i+xlMM8cmubrXi/vvLH6YXPww8kJZx+2ts7o4nc+VxqxQ7
         4YBun+AqtLnOdvoX+d+Xz2iSBavxKUrjciDsn9xtiN4CYQD3S9yU6+WS8kUzaPQJTlg2
         xbyA4IDePU4xXPio1mVXhQp5pVDDkB6Aqra8SHsApkfy79HHSsl7Bvn6tXu6e8m39Kbv
         D3wI3OXMT/PSZl/VxXV/bufQt2vyzebZQN9Bxqo3E/EIZ9y+xWdC/Ln8Bs1Wdn6HCPYQ
         60HqeP8yYheaRiw/+3Wd1dK57DFXCEVlSeQZl9X3beOeuHlapZlPOXoRu8j34NuSsMct
         2NTQ==
X-Forwarded-Encrypted: i=1; AL+hErF2QnL2BcH78hZpHeE+S93no6SrKm7gJeusjcmcJIpAyMnU+b8y3tuTUFy/9Vciac9uZSBrikk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BP10L1hzCzsFaemmusx5It1yscIbucynTNYzSsfUenZh7Sb8w
	FPrxoNOeJ3MpJVnTznNHk6yNCERD1WrmB/Pu8cTN650r7QDHoBj1WZNZ
X-Gm-Gg: AZFdTZe/W65YLobIVLXPmz1ll1sWigf1+tYnqnTgZC3mXo8XZdNslIXoLJmj1N3MC9W
	wMHeSl7T7+wty8dWBnI3DkHSejq58Drxo/CgciqPj2nnny/r7ASqp5pkv0xJAftp332hKE9KoHj
	tLZvmNXT7QM8angJ5NLPb2G6TBBBc5n9wQ5zZpUInLrJ9DCkb3RlJqJvZFwDBmN0aHmYFEJMR4r
	hIGR7GcZ8/nzhxL8IbSGhFABnVZcPL9swtW3BDEjwm7ZdGBBLrlCDtW2xx7m6rqRKCibXJPIISu
	dbsPt7KkAUbmEQFOOfovBB828MMpgdsUzyJ6EB401r8uK1v8iLWrhbX9lidbuyVr6cwZeimiTFi
	1kYhBHqd+V8V5ocrlGRXa5yXNqdQ2kYhUiElvSzio15onnjwD8ID1oZx+Gl+pG1UUMAUyQtl+Qd
	qPEIw9D6RUNptMfK1nXlO3h0KTSANa81odlmZZNcQ3wZHOGeVLSDydP2O3eVU9qa2ggeDw9jndh
	w6tPB0uLLxn+514AajWcEVTTquJ/Hh+zkiMgfvKVjBDsKsZHfn1a/hFW8ZbMvb+E7SMUAt73+GX
	4IcpC4GeAzWYWaAPJpab
X-Received: by 2002:a05:6000:491d:b0:4ab:f5b0:a7fa with SMTP id ffacd0b85a97d-4b598a60967mr13697952f8f.33.1795599194330;
        Wed, 25 Nov 2026 01:33:14 -0800 (PST)
Received: from fedora ([5.131.7.59])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c3csm32077607f8f.36.2026.11.25.01.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 01:33:13 -0800 (PST)
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
	lvc-project@linuxtesting.org,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Subject: [PATCH 5.10] Bluetooth: hci_core: Fix not checking skb length on hci_scodata_packet
Date: Wed, 25 Nov 2026 16:33:01 +0700
Message-ID: <20261125093302.225552-1-petrvaganoff@gmail.com>
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
index 60b1dd16ab0d..0ebfab2c26cb 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -4819,18 +4819,22 @@ static void hci_acldata_packet(struct hci_dev *hdev, struct sk_buff *skb)
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
 
@@ -4848,6 +4852,7 @@ static void hci_scodata_packet(struct hci_dev *hdev, struct sk_buff *skb)
 			   handle);
 	}
 
+drop:
 	kfree_skb(skb);
 }
 
-- 
2.55.0

