Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795046867;
	b=VF2rSLjYA1UNoESckL0r/U1lLzhGdd8yTYRinZxJUVn+Ei7DnU2Yq3/8E89ijfgcEVPa
	 49iqhqvEQtNZjoR2bkALnHtYGB2imw2saS4fzgr7iYF7UvSibcFpTXl07xUuthfe5q/h0
	 NKy+K1MTJZmQhy1pWEuIDfVnmLWTffAvZgTQJn52g/1YMv9JbwA/3dYYWzHpA1MLZPDJH
	 uJ3lvw56doo1glR2SLONceh+rzN85+R+UCZsBT3g3tDGtVsjgiRWCv8w0R3ZwnRuMAKGZ
	 EyfrNpGD/6Wp3qju7o5m3QEo3U9GNRf2dHbiyYNEmh3HrmuHn5t7ORyEj/lNiyKA61w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795046867;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-TM-AS-GCONF:X-Proofpoint-Reinject:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=x3eKF68wPXRQM64TjaUlzJWD/D+4ifE8IGA9ToqKUIc=;
	b=raZZXfaitlQqh+afVGxkpe24LBQfBLBlR8a6VSi+/STaOHsEh7GW2zoJPZPYSu7YuNGp
	 n6/a4f2u1a64mtzlhD6awRKF5iJLAtJeDufqU9eZeigcakhKJsm4zjLlmST+iHYCZvp9G
	 uaQaigQGcJkfeywD/DLHSAz4UVla7C7alo4IJbCnUsscyozpa0zRLGiTwpj2bdOVhbZPk
	 zFpuapLX14T/lGfqPpVu29j9eVUQAH6Ry9szm6srBdyxjVXe8ECOErlygBONUCyidaC55
	 7g9gAb0UjF6zzVEsiFgew4EVqKzvEyZLgE4Eui7Ffhb1EWN6ClK5RHUKANHhdYpuQ8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=S78BghDn;
	arc=none smtp.remote-ip=148.163.156.1
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A80606A335
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 00:07:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87A80606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=S78BghDn
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AILQYXA2211917;
	Thu, 19 Nov 2026 00:07:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=x3eKF68wPXRQM64Tj
	aUlzJWD/D+4ifE8IGA9ToqKUIc=; b=S78BghDnIiagzsLsZGLrLQpo7gVsdioJ+
	ujJ8XUdVK6aOjC/hcn7Jqr0q6h33YruFAkw+2ZiVHKiz9xO0cuxK5f9AfRic3ze8
	NbodSl9gX6Cw5IZ+e4SzZ9vnkxvqZtUAaDwlGq2mk1X6tAQPkhfbmK9IItwgozCx
	O4pg6BaZDECsUD1jmPGNDGZJNI8xJ7hjR44GHfYRphXyjzqTjA5Nm+FfR59NdpJU
	doX01DXqhcnXmT4SKmjz7aN/NjDrD9++PnHxotNsyM7LrPHVSTwXBMtGUBPPmPib
	kIrbJwbQGvO75Ll3Zi04YsvpsdUj7eIHSUbNEKx83jN9Ngcb0yzlA==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j105t59n8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 00:07:31 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AILK4x43990085;
	Thu, 19 Nov 2026 00:07:30 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4j1hd6s16b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 00:07:30 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AJ07SPo27591320
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Nov 2026 00:07:28 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1D8375805C;
	Thu, 19 Nov 2026 00:07:28 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6EDEF58051;
	Thu, 19 Nov 2026 00:07:25 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.67.93.165])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 19 Nov 2026 00:07:25 +0000 (GMT)
From: Mingming Cao <mmc@linux.ibm.com>
To: netdev@vger.kernel.org
Cc: Mingming Cao <mmc@linux.ibm.com>, maddy@linux.ibm.com, mpe@ellerman.id.au,
        npiggin@gmail.com, chleroy@kernel.org, ritesh.list@gmail.com,
        sshegde@linux.ibm.com, nnac123@linux.ibm.com, andrew+netdev@lunn.ch,
        davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
        pabeni@redhat.com, linuxppc-dev@lists.ozlabs.org, horms@kernel.org,
        davemarq@linux.ibm.com, haren@linux.ibm.com, ricklind@linux.ibm.com,
        bjking1@linux.ibm.com, shaik.abdulla1@ibm.com
Subject: [PATCH net-next 3/8] ibmveth: Refactor buffer pool management for per-queue MQ RX
Date: Wed, 18 Nov 2026 16:07:06 -0800
Message-Id: <20261119000711.18093-4-mmc@linux.ibm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261119000711.18093-1-mmc@linux.ibm.com>
References: <20261119000711.18093-1-mmc@linux.ibm.com>
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
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=IouL47/g c=1 sm=1 tr=0 ts=6afe3dc3 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=U7nrCbtTmkRpXpFmAIza:22 a=VnNF1IyMAAAA:8 a=B-TeTARddAlAh3keUi8A:9
X-Proofpoint-ORIG-GUID: 4SDTeeI0ekTiJxKlNWw972CfoWX1Jt7O
X-Proofpoint-GUID: Rn3ntHV9_gKLhHylL1Cxk_2setPN4nXH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA4OCBTYWx0ZWRfX0kLqyeKbPk10
 KAy1bMywUTsHsqw5QcbYj5UU7FU7Rd2ZzABbtQNUlVYy1LBM6MirKLpFlzUqTKTmXNuWTT2cOFY
 NNXZc+d3LfEBw4ksO6zvEJrbEkkvHwT98Cz4yFFZaGeTiVW6eES2qqCYAWLvNjFRxJ+pibrlHIj
 e5jO1/CLh0/b0n1FARvWQ3AC/4eQ4MQe2R6PP8UIq74+CY2so0D2Vn41Tsa/hJpt6U9BwzN6RGa
 Nk658+PXRrD+LMuzTH8wKuEKVk2+7+jgBMaVJTMQz068n1VV5dwWlBSxyIsiC5t500fD177a1pU
 3NSrDcBFywaXzwbEunWqhiC1/CrVyq+NOxuB63AwS0eIAe0AWTM2Dv7EuKv418wElcgiLZc04Kj
 yMAAyBwSz2DkI6rruPevw3ey/169tSPiGqJgDksPqXKw0034jYBxUcM3iZn1YTnBAtXiylVbGEQ
 P4/4GAYxCPXZ6ptfMjA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA4OCBTYWx0ZWRfXxt5lwZKMBIjh
 LS2J8vYZGtglfRL8AW1XrgKVSkgMBFLbU9VsSvymTYX26+CGpCUWFn4qOe7PlKaI4Fo0sVymKuo
 hQtncnHLuMq01ByoNcz8erWtp+dqMss=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_07,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180088

PHYP returns an RX buffer on the queue it was posted to, so each RX
queue needs its own buffer pools. Allocate and free the pools per
queue through ibmveth_alloc_buffer_pools() and
ibmveth_free_buffer_pools().

The free path now releases what was allocated rather than what is
marked active. close() frees the pools before the RX queues and the
filter list; the IRQ and NAPI are gone by then.

Signed-off-by: Mingming Cao <mmc@linux.ibm.com>
Reviewed-by: Dave Marquardt <davemarq@linux.ibm.com>
Tested-by: Shaik Abdulla <shaik.abdulla1@ibm.com>
---
 drivers/net/ethernet/ibm/ibmveth.c | 119 ++++++++++++++++++++++++-----
 1 file changed, 99 insertions(+), 20 deletions(-)

diff --git a/drivers/net/ethernet/ibm/ibmveth.c b/drivers/net/ethernet/ibm/ibmveth.c
index 559c4d2d957b..20273240d8fe 100644
--- a/drivers/net/ethernet/ibm/ibmveth.c
+++ b/drivers/net/ethernet/ibm/ibmveth.c
@@ -658,6 +658,100 @@ static void ibmveth_rxq_no_skb(struct ibmveth_adapter *adapter,
 	schedule_work(&adapter->work);
 }
 
+/**
+ * ibmveth_free_queue_buffer_pools - Free buffer pools for a single queue
+ * @adapter: ibmveth adapter structure
+ * @queue: queue index
+ *
+ * Frees every pool on @queue regardless of the active flag;
+ * ibmveth_free_buffer_pool() skips what was never allocated.
+ */
+static void ibmveth_free_queue_buffer_pools(struct ibmveth_adapter *adapter,
+					    int queue)
+{
+	int i;
+
+	for (i = 0; i < IBMVETH_NUM_BUFF_POOLS; i++)
+		ibmveth_free_buffer_pool(adapter,
+					 &adapter->rx_buff_pool[queue][i]);
+}
+
+/**
+ * ibmveth_alloc_queue_buffer_pools - Allocate buffer pools for a single queue
+ * @adapter: ibmveth adapter structure
+ * @queue: queue index
+ *
+ * Allocates backing storage for each active pool on @queue.
+ *
+ * Return: 0 on success, -ENOMEM on failure
+ */
+static int ibmveth_alloc_queue_buffer_pools(struct ibmveth_adapter *adapter,
+					    int queue)
+{
+	struct net_device *netdev = adapter->netdev;
+	int i;
+
+	for (i = 0; i < IBMVETH_NUM_BUFF_POOLS; i++) {
+		struct ibmveth_buff_pool *bpool =
+			&adapter->rx_buff_pool[queue][i];
+
+		if (!bpool->active)
+			continue;
+
+		if (ibmveth_alloc_buffer_pool(bpool)) {
+			netdev_err(netdev,
+				   "queue %d pool %d alloc failed (size=%u count=%u)\n",
+				   queue, i,
+				   bpool->buff_size,
+				   bpool->size);
+			bpool->active = 0;
+			/* Undo the pools this queue already allocated; the
+			 * failed one freed its own partial allocation.
+			 */
+			ibmveth_free_queue_buffer_pools(adapter, queue);
+			return -ENOMEM;
+		}
+	}
+
+	return 0;
+}
+
+/**
+ * ibmveth_alloc_buffer_pools - Allocate buffer pools for all queues
+ * @adapter: ibmveth adapter structure
+ *
+ * Return: 0 on success, -ENOMEM on failure
+ */
+static int
+ibmveth_alloc_buffer_pools(struct ibmveth_adapter *adapter)
+{
+	int q, rc;
+
+	for (q = 0; q < adapter->num_rx_queues; q++) {
+		rc = ibmveth_alloc_queue_buffer_pools(adapter, q);
+		if (rc) {
+			while (--q >= 0)
+				ibmveth_free_queue_buffer_pools(adapter, q);
+			return rc;
+		}
+	}
+
+	return 0;
+}
+
+/**
+ * ibmveth_free_buffer_pools - Free buffer pools for all queues
+ * @adapter: ibmveth adapter structure
+ */
+static void
+ibmveth_free_buffer_pools(struct ibmveth_adapter *adapter)
+{
+	int q;
+
+	for (q = 0; q < adapter->num_rx_queues; q++)
+		ibmveth_free_queue_buffer_pools(adapter, q);
+}
+
 /**
  * ibmveth_remove_buffer_from_pool - remove a buffer from a pool
  * @adapter: adapter instance
@@ -887,16 +981,9 @@ static int ibmveth_open(struct net_device *netdev)
 		goto out_free_tx_ltb;
 	}
 
-	for (i = 0; i < IBMVETH_NUM_BUFF_POOLS; i++) {
-		if (!adapter->rx_buff_pool[0][i].active)
-			continue;
-		if (ibmveth_alloc_buffer_pool(&adapter->rx_buff_pool[0][i])) {
-			netdev_err(netdev, "unable to alloc pool\n");
-			adapter->rx_buff_pool[0][i].active = 0;
-			rc = -ENOMEM;
-			goto out_free_buffer_pools;
-		}
-	}
+	rc = ibmveth_alloc_buffer_pools(adapter);
+	if (rc)
+		goto out_free_buffer_pools;
 
 	/* NAPI can run as soon as it is enabled, from netpoll during the
 	 * direct close()/open() pairs or from a direct ibmveth_interrupt()
@@ -930,11 +1017,7 @@ static int ibmveth_open(struct net_device *netdev)
 	do {
 		lpar_rc = h_free_logical_lan(adapter->vdev->unit_address);
 	} while (H_IS_LONG_BUSY(lpar_rc) || (lpar_rc == H_BUSY));
-	while (--i >= 0) {
-		if (adapter->rx_buff_pool[0][i].active)
-			ibmveth_free_buffer_pool(adapter,
-						 &adapter->rx_buff_pool[0][i]);
-	}
+	ibmveth_free_buffer_pools(adapter);
 out_free_tx_ltb:
 	for (i = netdev->real_num_tx_queues - 1; i >= 0; i--)
 		ibmveth_free_tx_ltb(adapter, i);
@@ -985,14 +1068,10 @@ static int ibmveth_close(struct net_device *netdev)
 
 	ibmveth_update_rx_no_buffer(adapter);
 
+	ibmveth_free_buffer_pools(adapter);
 	ibmveth_cleanup_rx_resources(adapter);
 	ibmveth_free_filter_list(adapter);
 
-	for (i = 0; i < IBMVETH_NUM_BUFF_POOLS; i++)
-		if (adapter->rx_buff_pool[0][i].active)
-			ibmveth_free_buffer_pool(adapter,
-						 &adapter->rx_buff_pool[0][i]);
-
 	for (i = 0; i < netdev->real_num_tx_queues; i++)
 		ibmveth_free_tx_ltb(adapter, i);
 
-- 
2.50.1 (Apple Git-155)

