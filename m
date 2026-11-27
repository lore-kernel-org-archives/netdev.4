Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795786851;
	b=Pm+99jCL/TulT2QC3WHh7RIKWZZGkM9Cqmfqadnn9uOYuqkvzYuRwMYYMuyn2DmYfZdd
	 nnwJFhBsLKkDZu5/C0l639Xu7li1+6Ut91gSj3GQH4bXPQ0EtplFBGgrkCJOLXknyAFSs
	 9Egh66hye5cTTX1fJRP9YH1YamG8VXovIRL8EWJwk+tMbVTk4+AHWcrsqDZheeGVlVkTr
	 MPamyV0snlwb3dzQ6XIMIl5uSM0Ac7ahOg6PItsv6jZPJ0YIC2JSJA6jzQNOa52mMaWPi
	 mdx8B2NX9m5bdn+OmMCMUrQt+TFYCabgzrZTraaV3r5EhcTqEhQQIG2BKyJGEDpXCnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786851;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0AJWIA7czH9GdbmE5y7jSRhzHXqcVcwTzc1B62BZZmE=;
	b=MXyWr7XKnUbfqJi1/U+lFAh/RS0sSD2hf9X114XVk7pYdUZ6HYbr6fRKAwhV1KV/SlKt
	 maZlTWXj4V6u+G8xpJkdHh55oYIr1viWgO2Y9yEPkjaI+ABArmHyc6M0qayrBMpBiVIyc
	 WjSLhNHhF9WRx7nB/fw0svEe2OiA9tiERb6LBcsM2INH+FJRYJ51UWMaX2veY5Wuj9EFt
	 bxJ6G4qx1Q4m4KUM3/wnGQ7IktrDSX6arddjXAQ+eRBK+8wfr1jvFztdNOLvhKXeyjckn
	 WOiW8Wnhk/mxxC0OCejTPwiWU3OfA7sTtT6m0O+oLING+9RDgquJoFJfyoqsk8Tf07g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="P+cj/vaT";
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EAB606A31E
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 13:40:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74EAB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P+cj/vaT
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a06cc097c7so5058163b3a.0
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 05:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795786851; x=1796391651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0AJWIA7czH9GdbmE5y7jSRhzHXqcVcwTzc1B62BZZmE=;
        b=P+cj/vaT4MxktNnHPB4CKcI+P9/VHrGG0lfL2rwmQGr4IksHqVcr4rlAA+2RidCGym
         yZITa1CA5fDDLcbbB+j6B5Wq1u04uP4dihS6DbikUMYlG6VJklsP0q+1FWpl0s4zXaq1
         KMs2DWdnpXj7t/swjPPR1yzPl1i3e4GJr6fEm2d6tiAkVIX9ETMoSOU2B0fzmkVL1wJc
         KZq+83Z15V7DqFCmf/lcJIBPt+f91jUvT8aIHWwfivbX1nL6jAjkWJ2hvnpZUnRf8vA2
         rqdgN0I0RPBwrVi9FPJTKHI0P5FnPeGU9soPSU0mtLjqV1Ch30ZtAdmrkg1jIoWAS6hS
         hdpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795786851; x=1796391651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0AJWIA7czH9GdbmE5y7jSRhzHXqcVcwTzc1B62BZZmE=;
        b=NO279nYSbBzOOHs1hEB+eDhE2Gvk/QeO6rGLtD9NYx0t7io/+E5nhDgnA97+YLf2AZ
         4pY3qFCSr/v7UGRs7xvw4GGCrbehlfx9RMlNGGb7XH1HFtjCC+fj2EDTCmpPWZa4xMxO
         QuhComN5oeYPMS8dcRVWvVCCmfbcsnVk5Oj/H8agGLtQPBPbHa7JxAY7s96XraCveniC
         kXiMPIYOelZTZERD3f+wze7UKkcgENgOweM2Au5DY0dP3fxRP2njKGApHlF7Uxri8E06
         rs5JgreAqv5bZ45XLQ6Te/RI9oEYB5WxHKY71N7iR2LuhWwjwnUWQLdqfBFtnb78Ao4D
         WJYw==
X-Forwarded-Encrypted: i=1; AL+hErHg+PhudbN809FGdlkHd/AjjtaOnUonN1QB+VX+f2IPuS51f9PnidMSAfTF04oGjf3fDjwj0Pk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8eSRHpj/p/0hb/urKwTA7nk3bQdHkicbfK18wqVaDsbRtG8uAa
	8I4jlSsqpFZaQmEqGdUhPU2Rd8GHSqIWhiDUdSdwidQfx2dRBoEnQ9vb
X-Gm-Gg: AZFdTZfxeUZhbYXVX2ieq+STPZQXVoipr17G85ieeo0u2TgTSyxTNh7Jb2iW5j2vWdJ
	bNqcYfklBvM1NaovncpxEIBvEyVcHvzWCrZNbHqB7S4mxRaHfEalgufUE8jSWWxs7k26+LXJIXZ
	ReJIUNui0fGtDtU0T8Etoyd0vwBnfwWQUEXOlOIfT1UZhLWXG8ZsXTCevPOr0f4ZyuGi7DhSrKt
	i0XI6FaIgrTLsSUkb4WBnmFrMi1P9ltZ0nUyX8xIlqRUIHPQS3wjuA6fWTb9Kcn2x/2H9m2REi3
	/3PJT+pFgqAx7LoWvYThkWgTvJugoEekKJjyVWzXde0bjeICMYnzC2CdWM7YQc4VEES4kuun3W0
	0rog7Z/MApvAUZnjzp3ZGTAWSm7yVJ90e7Kl7ngpBELj5/q8pwQom94DzvWe3RVB1tcuKjbG3IM
	f9luoDGaOZh/CWSHK6Xjtx1BEKNE8JF7I+ToNXiFgOimeWZAS4NiAkGRBry9nPH0Evey7Ez5ZH8
	/kveJ4Nm4n8QYBrjt93Jvn8SRvj9XAzaeMMUstKC7JkV2w/55UfZJRcagtC9YyMxf8XE6NFkqOO
	kzxKlL8aL0iAhp/5AbP0MHQvjHpRoDXDDr2IoQd7H6hb72/Zu5NvVqKofggI9TM46+kCfaivFkF
	WBM7RIdUSXr6RKroySju698DOnD7J4U+LsIXNsYMZhzzYPfLrNcPXr9AN5+SjQNfsZuoLuOjmK9
	BJCPAp9VZJwxTil7RQTiH8hnJYlZON6xkUg94nqsA=
X-Received: by 2002:a05:6a00:414e:b0:8bd:281a:5cb0 with SMTP id d2e1a72fcca58-8c8796a7bb0mr21771676b3a.6.1795786850971;
        Fri, 27 Nov 2026 05:40:50 -0800 (PST)
Received: from LAPTOP-3B99V33A (ec2-18-138-229-8.ap-southeast-1.compute.amazonaws.com. [18.138.229.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285b60csm12705838b3a.9.2026.11.27.05.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:40:50 -0800 (PST)
From: "Bin Luo (University of Electronic Science and Technology of China)" <luob87709@gmail.com>
To: oe-linux-nfc@lists.linux.dev
Cc: johan@kernel.org,
	david@ixit.cz,
	kuba@kernel.org,
	netdev@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v5 4/5] nfc: nci: drop stale rx_data_reassembly on errors, timeout, and close
Date: Fri, 27 Nov 2026 21:40:28 +0800
Message-ID: <20261127134029.1813-5-luob87709@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
In-Reply-To: <20261127134029.1813-1-luob87709@gmail.com>
References: <20261127134029.1813-1-luob87709@gmail.com>
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

When an NCI data exchange receives a partial NCI_PBF_CONT fragment into
ndev->rx_data_reassembly and then terminates due to a data-status error,
CORE_INTERFACE_ERROR_NTF, data-exchange timeout, or device close, the
buffered fragment is left behind. On subsequent packets or after a
close/reopen cycle (including listen/target mode, where
NCI_DATA_EXCHANGE is never set), stale bytes are prepended to later
responses or leaked until device free.

Drop and clear ndev->rx_data_reassembly on all four paths:
- In nci_add_rx_data_frag() when a nonzero data status is received.
- Unconditionally in nci_core_conn_intf_error_ntf_packet() before the
  NCI_DATA_EXCHANGE check, matching nci_rf_deactivate_ntf_packet() so
  target mode is covered too.
- In nci_rx_work() when handling a data-exchange timeout.
- In nci_close_device() after flush_workqueue(ndev->rx_wq) on both
  close paths, guarded by req_lock and !NCI_UP.

Found by static call-chain audit and code inspection.

Fixes: 6a2968aaf50c ("NFC: basic NCI protocol implementation")
Fixes: 004161cb52ac ("NFC: Handle error during NCI data exchange")
Fixes: c4bf98b220cb ("NFC: Add NCI data exchange timer")
Fixes: 98ff416f97c5 ("NFC: nci: Add status byte management in case of error.")
Cc: stable@vger.kernel.org
Signed-off-by: Bin Luo (University of Electronic Science and Technology of China) <luob87709@gmail.com>
---
 net/nfc/nci/core.c | 15 +++++++++++++--
 net/nfc/nci/data.c |  2 ++
 net/nfc/nci/ntf.c  |  4 ++++
 3 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/net/nfc/nci/core.c b/net/nfc/nci/core.c
index efd4e5e..f832251 100644
--- a/net/nfc/nci/core.c
+++ b/net/nfc/nci/core.c
@@ -582,7 +582,7 @@ static int nci_close_device(struct nci_dev *ndev)
 						   ndev->cur_conn_id,
 						   -ENODEV);
 		mutex_unlock(&ndev->req_lock);
-		return 0;
+		goto flush_rx;
 	}
 
 	/* Drop RX and TX queues */
@@ -622,9 +622,17 @@ static int nci_close_device(struct nci_dev *ndev)
 
 	mutex_unlock(&ndev->req_lock);
 
+flush_rx:
 	/* rx_work may take req_lock via nci_deactivate_target */
 	flush_workqueue(ndev->rx_wq);
 
+	mutex_lock(&ndev->req_lock);
+	if (!test_bit(NCI_UP, &ndev->flags)) {
+		kfree_skb(ndev->rx_data_reassembly);
+		ndev->rx_data_reassembly = NULL;
+	}
+	mutex_unlock(&ndev->req_lock);
+
 	return 0;
 }
 
@@ -1607,10 +1615,13 @@ static void nci_rx_work(struct work_struct *work)
 	/* check if a data exchange timeout has occurred */
 	if (test_bit(NCI_DATA_EXCHANGE_TO, &ndev->flags)) {
 		/* complete the data exchange transaction, if exists */
-		if (test_bit(NCI_DATA_EXCHANGE, &ndev->flags))
+		if (test_bit(NCI_DATA_EXCHANGE, &ndev->flags)) {
+			kfree_skb(ndev->rx_data_reassembly);
+			ndev->rx_data_reassembly = NULL;
 			nci_data_exchange_complete(ndev, NULL,
 						   ndev->cur_conn_id,
 						   -ETIMEDOUT);
+		}
 
 		clear_bit(NCI_DATA_EXCHANGE_TO, &ndev->flags);
 	}
diff --git a/net/nfc/nci/data.c b/net/nfc/nci/data.c
index 4253ede..3bbebb9 100644
--- a/net/nfc/nci/data.c
+++ b/net/nfc/nci/data.c
@@ -220,6 +220,8 @@ static void nci_add_rx_data_frag(struct nci_dev *ndev,
 
 	if (status) {
 		err = status;
+		kfree_skb(ndev->rx_data_reassembly);
+		ndev->rx_data_reassembly = NULL;
 		goto exit;
 	}
 
diff --git a/net/nfc/nci/ntf.c b/net/nfc/nci/ntf.c
index f5c9a8a..3ca1009 100644
--- a/net/nfc/nci/ntf.c
+++ b/net/nfc/nci/ntf.c
@@ -132,6 +132,10 @@ static int nci_core_conn_intf_error_ntf_packet(struct nci_dev *ndev,
 
 	pr_debug("status 0x%x, conn_id %d\n", ntf->status, ntf->conn_id);
 
+	/* drop partial rx data packet */
+	kfree_skb(ndev->rx_data_reassembly);
+	ndev->rx_data_reassembly = NULL;
+
 	/* complete the data exchange transaction, if exists */
 	if (test_bit(NCI_DATA_EXCHANGE, &ndev->flags))
 		nci_data_exchange_complete(ndev, NULL, ntf->conn_id, -EIO);
-- 
2.51.0.windows.1

