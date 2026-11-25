Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795599152;
	b=RJBTiSR6uTNQu3MrLGh26VMT+lk2kxOfl+3o5lXHNO1CRzgJA3uIrpeJuvcykQfspKIm
	 myEvX7yedy3Tmp18gwHJvuQgsdc8jkB2EeuVXYUkgc7AUFLO5tHHuU8v4asCdmuoK2wMr
	 qUAdcwbVSt+i+FqlBCtviTlv99rYw0d1bTFkvfiNdMqA8R5W3dEi37EzEP0Yn2mXL1lry
	 misvQqSNGFbpUolfRlnqdhhD28js9lofj/i7sRQDNzRbwlr/2czmwK2D9mZG4Mxm8jEWE
	 ar/jU7U2am8Ymulil1TjiFhOnZZ2QFfImBK53zUF1xNECFlY1k3YxTAlvaGGkb99H4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795599152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=l4RHB6K7RgAz/nQf8J1fwTRQBwHcMKQGbkgU+q0PgV8=;
	b=n15NBzFFCuuwyUL+gxeQpjaCmKc+6tTtG5aNleMNF+ewOdDDQzwyuXliZSX11+zKIwS1
	 eKB1Y11CLAnIsoXB7sQWYbFWvsLQhfTn8ygcXDKTv0mbJHo3CKCekQ8Whtb4dJzewgQI5
	 NSzPtUOawhQ8Y6+TEwCj2fHjU87nkGLX4gvNI81NK9bubA1XC8C/miXLUDuYDgdGEkQlV
	 R0Q6yZ9GA+71w2pDXlYeYVsUcsEF7aqMZ4YoqL/8WV2ZSur2M3hNm5HceuThJsb+zBGXZ
	 1Ki3U6wO9GWlOcU+btfaNQausDk6swIezbaFm2wIxjLUmto56Tac8E2IbGg5h2Y2KSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ucWggkp/";
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98B1606A326
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 09:32:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B98B1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ucWggkp/
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so47485235e9.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 01:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795599150; x=1796203950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l4RHB6K7RgAz/nQf8J1fwTRQBwHcMKQGbkgU+q0PgV8=;
        b=ucWggkp/ylQeQo+d3P3B4kePoFLjOBL4EURBC03OYEs6t0KRzCt7GAV9npYPdoHzLU
         y2QCcusM0/gl1bRT/7n6sOQOlH8ZAZvNUziP9aOJxCeCF9B6O2ZQyb9/irm9jUDgVqfd
         KBrfejRrsKZfakTfthYUuLt3B3LVYrXRrjsXjXu/0eq13CNTZ28ATtCXjnhlXj8oGqn+
         y+XiET0B6ez89fSEwIN6oUY3zGE6Mo8w+F66hI0KqkGCVDkgSAUXbPu4jpmIAF3pImhn
         TMQVlLSY2STfsdpLmQEvN8nj7QxV60X4C4kNhU0wWxhADCPybT0L3FZ+KRhBwXqR8aTP
         bhmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795599150; x=1796203950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l4RHB6K7RgAz/nQf8J1fwTRQBwHcMKQGbkgU+q0PgV8=;
        b=rGNSIrBsCH+uQA+nZDAa5QliwBnIQKhCmpVDWYkeM4VvZy6oXYiGBOW4hWTIF4mcwF
         WP9nwfbCe2MuSlY96sOdsAkRMGuXFU2vSsydsD3UZpEmHTp7cLrqedbshv3Gd6+/jne8
         4yksJ8LWRsUn7Acz8Omfz0DTQSXT4omQ4X7l4uqkrwCImDN4fBz1zPoua1TE+5oCE1hx
         3efunaYypqpnanfH4sKaHnWxkQOtoNlJotfX1uZMJSH3/s5BXVfsjc36nUy58mSFa0Om
         dC8+tS++y4CX+mohFwhR9hOCKyT3eUSDX5ufHgfQDotQh99dNc8BU2z/ijVQJpi1AVr2
         b7HA==
X-Forwarded-Encrypted: i=1; AL+hErHuEY0MVv4tIeDnhxS1OkOlcRJeliDQS39X+q59OK7y04XHaVpd7da1Xt5R0c20MYmAhIDEsYw=@vger.kernel.org
X-Gm-Message-State: APuU4Z805zaUui4wXZm3ZZnVDPt9kBLOLCvt0Cao3RYHPjUfEYAyRbyS
	zwrZ1wdRqL2klSAAx+FDMcfWTYaV+md7meRdo4VWIXTFHCGpfapiRMld
X-Gm-Gg: AZFdTZcM/qV+kzxrhkF95KWA2NgOnUBO+SO48Gj4Y0VeEGntJq+QNUCyQkYc14C7YbP
	xeK5RnisDTDX82u/pjVcckW+k2Mp3TSp7FMFDYqAkoY/waqzRDcbELftob1fZTMKI0K+pQobEE9
	OeufxcOaEcajpbnWjVKuE4kNrgLBX8iDtGZUnlvNW+fRvYZUl8m8ti0MTrGG1OJ4QysOlXRtPwf
	SAobVqZzex6zna7PW1ousMOo1eErx6b1vgxyB//iCLhVozNfwX7/m8D4W/e4MJ/NsT8XQ/4BePd
	pn8LFtd6AmiBQ7jDaf2GdLXARCVjjaTCdy0w7zMvs0VdVg9K6Gh6Qi9T3SVmO934ls3kdCAc6p7
	zlMdmSPWFo2fdzUomhkE/DKxbOOYk+nMRUdYG8v6pJoRP+7Qk+senKXV5nh4bWBYPDc+p2Xfn2r
	k0oYAu3BuuSXd7/yAtVfS8mNTnSiFFeXCbkOqhWZynL16r0nYgQOFyhkpoCnX6h9Vy1z2FEVbrI
	Tx6jtJ9lMD/CZASbf4seswhgiOrS7tw1k6XlluksqeVwTo7AgeHXOJ4D5BhRYzNO2Dau3B4xPav
	6ZYXaYIc2ZZRRk657uBB
X-Received: by 2002:a05:600c:4e02:b0:4bb:5d39:95fa with SMTP id 5b1f17b1804b1-4bb88811c82mr338133785e9.12.1795599149909;
        Wed, 25 Nov 2026 01:32:29 -0800 (PST)
Received: from fedora ([5.131.7.59])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884911e3sm608782495e9.6.2026.11.25.01.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 01:32:29 -0800 (PST)
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
Subject: [PATCH 6.1] Bluetooth: hci_core: Fix not checking skb length on hci_scodata_packet
Date: Wed, 25 Nov 2026 16:31:00 +0700
Message-ID: <20261125093208.224568-1-petrvaganoff@gmail.com>
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
index 1639097a865f..443a1bb76019 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -3786,18 +3786,22 @@ static void hci_acldata_packet(struct hci_dev *hdev, struct sk_buff *skb)
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
 
@@ -3815,6 +3819,7 @@ static void hci_scodata_packet(struct hci_dev *hdev, struct sk_buff *skb)
 				       handle);
 	}
 
+drop:
 	kfree_skb(skb);
 }
 
-- 
2.55.0

