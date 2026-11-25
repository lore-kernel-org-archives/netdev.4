Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795599056;
	b=DHd0TZ5rIXPfJ46DjnBy+kSe1cPqkZFbADn7ZMpeMmYKvZUh2a3EdViFmQI2OjnSJfOF
	 +Vii0YcUM6uZADAnWatAusNBeZ2M9Ky3MQ/GVRepN1eq++3kloinxA7w2XP5zty43UP5E
	 aDWP+3t9AOCM1QNbd2tZR7bm54fAInF81KK0fR7PelpgnyuSxAXPSTz+fYPimojvZBuml
	 5/k99PDhKiwaMywMi8eJ1euCywZaPQ96ZERjma0ncIABMnUJV5IZymux3iBxRdtifAYLR
	 +dspCtMhcav/jYornHGdRHUXm5pKBtBQsw8RHAgr5Re/f2+YPPr5au0mvvW5cBaIfiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795599056;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=I2k/a6mQECX9SJa18m0wd08GRI20x24K3kfWl4JRMIY=;
	b=iXFHtwTsSpgWLqC6Y6Oa3HkkR0LADO4rWoL23byQHskmOhrP7SJM246iOqLfkSFTShTk
	 0dPIN4G0FkGRMmJIeSewaFKpPa076u3jEYHrDYEeDkWm4Bhw99qWinIJhoZmT6bU9WaCv
	 RV47LXhh/mrFRo3tnQQAtixCyQti9sDUM0O8HtjODl05fKYXyesUgMXv44xHnmj4P816X
	 FduBJzV+7/f7tQlig1USbgPzx/9W0LfXg72myAA6mPhbL7f0Elo+ij12i3S89GLTOIJAU
	 BKcaPUgNHiqhemefS7/bMKVFWwfY+3b072BXBIfIMzgfWXJPjL99lxc/A8p51P1tC7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YNWXc6r8;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3258D606A321
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 09:30:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3258D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YNWXc6r8
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4a5024b3c28so3790579f8f.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 01:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795599054; x=1796203854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I2k/a6mQECX9SJa18m0wd08GRI20x24K3kfWl4JRMIY=;
        b=YNWXc6r8Tr7pGkQTkgrOwXGti2YSQEYweanEGmmVxaHxG5ojfqnJbZG0bCR8C3eAo7
         YRiN41T5jMnoDCHmBwZCD1pmx+RoHAbsAeJ7zYnDxpPVQsYYiEv1yKYZsYaQO/RSxRD5
         t4huvYenXDx8fLJwmW7BmWkueDVWntqeYQkmOz9udTrjEhUyRPhqbGde7SojZQS/lLez
         EopmoOeJFFu3DIT+PMpbB4g7KCBvpgij8B9iFQ+3ezCb5ZOLfD2HcUHw7/QNqpmXiXzt
         XF01dUkcGQqzzd+/kOkh4HI9++vDoICoyYn0Ytvp5lNBmTdAxnN0rUhCk3/FNrG4UUmK
         CDiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795599054; x=1796203854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I2k/a6mQECX9SJa18m0wd08GRI20x24K3kfWl4JRMIY=;
        b=vIcYdJIaN13Vmr39T1lbFVTJSr1cFHDw8RwAIDE4doYLLVPR4fmebgzVHp5JStrPbF
         gohjgaP0wQC/v+T1Y2VVERGmPgldkZa0a2LNanonIdTXqGGai8qurBa9F9a7P/Dblk59
         AcKaGBdZqeGqZH5BqbedVmSGcMuiDnJO824kTq8dbN2XCzM0cNVAr8K3s2sNQkKoW1x4
         olzF9hUIeyGu92fr1RCfbUl6VG4edScLvhiw0aGqcPvgp1mhgKYrYbOsya1fiQjuewP0
         UAM/kG6E/PUGX0Mv+4lw6wr4AGyWkY+neO6ANVGevWfASpU9Yf+VznCI8NKlhOOt3dP5
         aZXA==
X-Forwarded-Encrypted: i=1; AL+hErF6gTl/PQ+Fio9gJBsUmUMj+yLMxj6Tnv56AduTGxsG6Aw6BdTXaE/7RnDdAEwd9v0IRP03wuc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cZ7FfRsrvZ8hCEFWNPmmwnOzCwvBOd9tjpmPSEB+OCvofRZNO
	/MsZZsbNJtEZgjNHdLiimA9uTclPHHsRmbljMTAo+Ez4NQWYlnYW03Iy
X-Gm-Gg: AZFdTZfQjU/saPzvU9uyMHiTWWe2NEftvWsTf2BlkB5XJ6wYKkYsRXPcNVgNVH6O0mA
	SJcqZVfxfR878Ownf0Y1yPPXr6rcMUpl7ePWEO4nAcXjDKiu4jPjU7GRLYhvaNIboAcoT8IIdDW
	Wo538rSfAkb566ZIE+TXo84Mn5vLuLsdqbS6UYgZc34XzI0favaDb2HFPgHkyh13a3W3EYk02Q/
	Rsy8A4hUf900UKKn0eKherDNzAHSMqPYVAGfimEZWUvgf4DE+9Jup/9RXPUc6i2cIcBJhTnW9HL
	qCNkm1Lvlj5mtLcWYc8Ed154b3s8z4B2IR2kuByRPcNHL/D7GcgU7cBE9vVvRGbUMM25rG6TWFM
	waWn3TRiquUZ/a0G8e/Z7VOFAXQIfe9JI2+dfDYiy/6GhZTuQKp9cLfUxdNGYgr988vlQcFVSNx
	3+P5KsQD9Rp9rKG53KspPMzGE0IP5MSMiry1/Q0MjSnPSDvuzDQrS6/VvpYKF1R+PnklwCqPKKt
	M/PxxN61rpfqzR1eG0d+xZ7ZgpNPMY4ZcAn6+r1xs+pfduupdhxM/wJGDSD9twHjkkKCJN9TOB7
	oiCzfkOBuqB2VcjwhpPT
X-Received: by 2002:a5d:64c5:0:b0:490:1395:9b00 with SMTP id ffacd0b85a97d-4aa545e25c0mr40657507f8f.10.1795599054259;
        Wed, 25 Nov 2026 01:30:54 -0800 (PST)
Received: from fedora ([5.131.7.59])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bc8ce06sm32220869f8f.47.2026.11.25.01.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 01:30:53 -0800 (PST)
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
Subject: [PATCH 6.12] Bluetooth: hci_core: Fix not checking skb length on hci_scodata_packet
Date: Wed, 25 Nov 2026 16:30:33 +0700
Message-ID: <20261125093035.224140-1-petrvaganoff@gmail.com>
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
index ff3ccb33da0c..f32473e02c1e 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -3905,18 +3905,22 @@ static void hci_acldata_packet(struct hci_dev *hdev, struct sk_buff *skb)
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
 
@@ -3934,6 +3938,7 @@ static void hci_scodata_packet(struct hci_dev *hdev, struct sk_buff *skb)
 				       handle);
 	}
 
+drop:
 	kfree_skb(skb);
 }
 
-- 
2.55.0
