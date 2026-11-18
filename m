Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794998475;
	b=lCaS7mKnaYj49E+gHObCJLTXpSEbFNqhXTT5UBMAH1Urqq3Z2TjcxIxC62ga620kcLxs
	 7YBQAqpk/MPQi1E41g0z7re7YeHsJxZW2m+zJxsfBtxGIQz5VDqmrIATSvyLaR/SD4NXL
	 tsmpYIahyBzGiJ/0MNmF2/eRKAFmD4wBZsQhVNa1xOi8EF5a6mVUuOxzpkdcOLt02zTEV
	 WUB7cpTU103ztSdRCrdmkYzWUF770FebsrUHqk/FY/simT2UMujrVFDnNIEPE8sFHnm3/
	 Wz+vBJcyoxekloxghIewe1awbOsHWMQdERaRuI53240c1MlzQE0zYoR/n0kco7SXWDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998475;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=01DBsGBZa1VYYjKfFfNmmb/bgs6SOiz9S6VzXEyzx0k=;
	b=uEF2Wo2su1vXiJfSctC61OHImeFJ+IBP3EVE4WyKMkh8scsZ0ImwjmaPFF3+ciJtjzx2
	 0CcOYtIbfJSiwk7/OP6JtQICRPaF9BHK7U1QEho5/mncLeSjC9DXLSVcRdul7dgT72EAP
	 IO+02DtS08UvwMyTJnUwXUruPryoPq4NhTaAsdEWe348+PcEB2lT+iaQQJM8+OSvni+bz
	 NbsNoFMkZGBWYxoWKECMYmnvjywcRm5I5UpI02qNJMj7jeYKmKO9D0SKG3chPUENhhFjt
	 NKFE1toAx4O3c1FI9RhwwoTkJ6Ap4Kcfdg89DCM9DmNcceK3ezrk2z8qQMlg74S2nDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="i5aog/b1";
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D37260A262F
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 10:41:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D37260A262F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i5aog/b1
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4a42b34e930so561599f8f.2
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794998473; x=1795603273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=01DBsGBZa1VYYjKfFfNmmb/bgs6SOiz9S6VzXEyzx0k=;
        b=i5aog/b1DiiziDmBI1wQWH4FbeyiZghU5cavMqPm0LrleZxya0Ybfs6QgKOF+6g4fG
         5ofQ4k/AhH3sJGDYtIEMHNZ62lVjRU/uR5sXqTW1pb2eRwA3MY0eg1wBEn/cD8s6NFj7
         mjnY6T2n7M7/+Gjy+xODf2cGw5aiW+Z1Rhq3XzmkqN7KZj9ZCNQf5CVhoDchsXGf64KZ
         ciFKJ/R0z+flN6nwsc/aUHBEWWvKFFoplUH+lAflfY/l51+TGG8zYNrRpeJBhh8jMTkh
         YZd2saFXFUj1LBJoTIdW1xDKPvhGmT8U57DaICsHFv5CGPEtgwv54PIUkSvYjAid9uN4
         EzDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794998473; x=1795603273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=01DBsGBZa1VYYjKfFfNmmb/bgs6SOiz9S6VzXEyzx0k=;
        b=CabwQxTq5VHzKrFms+5z5ZfWVyWqjT3KCxqn7N3GmTooMYm6JlJJHcbVfOQwAc9KCh
         hs+FUVXZEVa1RdHdUDQLio0VVKIyJrmGZvgojLtzQ5xtkD3uWJ86jpN8H4RZQUanqTq1
         WjP2uLvm7uYN0xNUcfEymCzUC+ivbn693JCyLSmHaPA1XvsyVM9IQwk2lfCVBTnbGcTq
         YWX/4WCxurJQktQKFEk8n/itg0OA1uxbX4ec0TMwU1Ve5qDZvwfWbhswLe2hWUs1gvc0
         NVxIhO4wxHFWVoQiuZMaZD1vGvBFJmZPrO8leW+hJnZj0eNEK/HDX7Z8MZ5m2l/JTf78
         rD0Q==
X-Forwarded-Encrypted: i=1; AL+hErH4emK1KpdI/IB1ba8pkRjRlKTVp8eOX75dAfnQVXXd/jYAn+1XBkG3vuQMg4RGM2qR2ewpEsk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8h5wD+Rx3HnIfnWTp0IPVSWJTQ6eSLIhx0El+43fLDOkxEUBLh
	mkQiNmTtkEmK8TcKN2c6tto9GPKJmYxUCJeSCmsCl6rX48YEgnmxyMV2ClYeWIi3
X-Gm-Gg: AZFdTZelZTj67yfAKQM/EiCvYvTmVohAvOLF+DW+GIBWcwASPSUdGpul57Y+y1OHnm9
	GFzyFr5mLcIOBIhs1JzMq8TXFHP+AmJFExJODfY9UxVD3IWn0lwctNN/bNpQdk2W8MI4pgKHhEY
	iwNFEHaFS7WtDDVvElCz7G/u67m0PWCEMQwncBeH3t7F0qoEYm/C1jBOYt9R7gW1DYKy39mcOCE
	IfC/ksn2m4jSEZ5wJuCqEU8OzRZsVeGxtNPxhAXt6h4FQbwTIEhkUMe0n6iPj0h2lcPauHdLaiE
	8KJtvMLKvnlxdWPKh5wMM9WCiQaT990eYJRarkbmJNXwj5LWHnlUldsdzELFFd0VkcVyn8QzHMS
	bGMfzT5uv8S63F8y7LfvPLlLAXgKB4++Aj0JMcYO/x8YQ10uzkbxFZ0IWvvWx74dG/+0pCBNNXc
	mQaHvviCudo7OUjWVWAr0uoasmVQmu8h7Chhi14OQFXYneqStkkp4vuIp3FB0nIMWEz8fFAiRvP
	CooKmNxmPybcI84xxqUCGvF0MdP+JVsQiParTwBry03mEl4SadaCJV0fq77r/WZGTabw0KDf5h3
	5+VmGYkhBszDTFhFmw43ZnPgd7po6qt/9p9rB96vnK9q4oxzvpqrHZRc1aOgPHjavY3U2WY3/9+
	zgWUv9eogJxhErQ==
X-Received: by 2002:a05:6000:2f85:b0:491:92e5:b5c2 with SMTP id ffacd0b85a97d-4a63947578dmr5156475f8f.15.1794998473400;
        Wed, 18 Nov 2026 02:41:13 -0800 (PST)
Received: from VivoBook-ASUS-X712UA-M712UA.lan (user-46-112-114-48.play-internet.pl. [46.112.114.48])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a6573ba95csm4320525f8f.56.2026.11.18.02.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:41:12 -0800 (PST)
From: Stanislaw Pal <kuncy7@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Yongzhao Chen <yongzhao.derek@gmail.com>,
	Alexey Immoreev <luixo-public@luixo.me>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 4/4] net: dsa: qca8k: bound the data of a management ack frame
Date: Wed, 18 Nov 2026 11:41:04 +0100
Message-ID: <20261118104104.26684-5-kuncy7@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118104104.26684-1-kuncy7@gmail.com>
References: <20261118104104.26684-1-kuncy7@gmail.com>
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

qca8k_rw_reg_ack_handler() answers a management read by copying the
data that follows the Ethernet header into mgmt_eth_data->data. It
trusts the frame for both the length and the layout: the length field
of the frame allows up to 32 bytes while the buffer holds 16, so a
frame announcing more than three registers writes past the buffer into
the fields that follow it in qca8k_priv; and qca_tag_rcv() made only
the 2 byte tag linear, so the copy reads skb->data without checking
that the frame has the bytes it announces. The handler runs for every
ack frame, whatever its sequence number.

Size the buffer to what a management frame can carry, and pull the
announced data into the linear area before reading it. A frame that
is too short is left unacknowledged, so the read fails and the caller
falls back to MDIO.

An LLM assistant (Claude, claude-fable-5-1) helped write the change
and this description; I reviewed both and built them with W=1 on
arm64. The management path was exercised on a QCA8337 behind an
IPQ5018 (GL.iNet GL-B3000) with tag_qca.

Fixes: 90386223f44e ("net: dsa: qca8k: add support for larger read/write size with mgmt Ethernet")
Signed-off-by: Stanislaw Pal <kuncy7@gmail.com>
---
 drivers/net/dsa/qca/qca8k-8xxx.c | 21 ++++++++++++++++-----
 drivers/net/dsa/qca/qca8k.h      |  3 ++-
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/net/dsa/qca/qca8k-8xxx.c b/drivers/net/dsa/qca/qca8k-8xxx.c
index 76c0f7c97b..cd3569902f 100644
--- a/drivers/net/dsa/qca/qca8k-8xxx.c
+++ b/drivers/net/dsa/qca/qca8k-8xxx.c
@@ -170,6 +170,7 @@ static void qca8k_rw_reg_ack_handler(struct dsa_switch *ds, struct sk_buff *skb)
 	struct qca8k_mgmt_eth_data *mgmt_eth_data;
 	struct qca8k_priv *priv = ds->priv;
 	struct qca_mgmt_ethhdr *mgmt_ethhdr;
+	int data_len = 0;
 	u32 command;
 	u8 len, cmd;
 	int i;
@@ -190,6 +191,17 @@ static void qca8k_rw_reg_ack_handler(struct dsa_switch *ds, struct sk_buff *skb)
 	/* We can ignore odd value, we always round up them in the alloc function. */
 	len *= sizeof(u16);
 
+	if (cmd == MDIO_READ && len > QCA_HDR_MGMT_DATA1_LEN)
+		data_len = min_t(int, QCA_HDR_MGMT_DATA2_LEN,
+				 len - QCA_HDR_MGMT_DATA1_LEN);
+
+	/* The tagger made only the tag linear. Leave a frame that is too
+	 * short for the data it announces unacknowledged: the read fails
+	 * and the caller falls back to MDIO.
+	 */
+	if (data_len && !pskb_may_pull(skb, data_len))
+		goto complete;
+
 	/* Make sure the seq match the requested packet */
 	if (get_unaligned_le32(&mgmt_ethhdr->seq) == mgmt_eth_data->seq)
 		mgmt_eth_data->ack = true;
@@ -199,13 +211,11 @@ static void qca8k_rw_reg_ack_handler(struct dsa_switch *ds, struct sk_buff *skb)
 
 		*val = get_unaligned_le32(&mgmt_ethhdr->mdio_data);
 
-		/* Get the rest of the 12 byte of data.
-		 * The read/write function will extract the requested data.
+		/* Get the rest of the data.
+		 * The read function extracts what it asked for.
 		 */
-		if (len > QCA_HDR_MGMT_DATA1_LEN) {
+		if (data_len) {
 			__le32 *data2 = (__le32 *)skb->data;
-			int data_len = min_t(int, QCA_HDR_MGMT_DATA2_LEN,
-					     len - QCA_HDR_MGMT_DATA1_LEN);
 
 			val++;
 
@@ -217,6 +227,7 @@ static void qca8k_rw_reg_ack_handler(struct dsa_switch *ds, struct sk_buff *skb)
 		}
 	}
 
+complete:
 	complete(&mgmt_eth_data->rw_done);
 }
 
diff --git a/drivers/net/dsa/qca/qca8k.h b/drivers/net/dsa/qca/qca8k.h
index 79754755f1..b7aa0d832e 100644
--- a/drivers/net/dsa/qca/qca8k.h
+++ b/drivers/net/dsa/qca/qca8k.h
@@ -396,7 +396,8 @@ struct qca8k_mgmt_eth_data {
 	struct mutex mutex; /* Enforce one mdio read/write at time */
 	bool ack;
 	u32 seq;
-	u32 data[4];
+	/* The data a management frame can carry */
+	u32 data[(QCA_HDR_MGMT_DATA1_LEN + QCA_HDR_MGMT_DATA2_LEN) / sizeof(u32)];
 };
 
 struct qca8k_mib_eth_data {
-- 
2.43.0

