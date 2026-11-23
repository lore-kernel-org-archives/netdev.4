Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437895;
	b=SPh0Krug5XG7Zdf6bZukwRHUjcKHzUjL/EMpPHRJ2wjnc0uoAKNDz1lB3AfPFvlLPLn5
	 XEUO/2xjw/qvS3GIU1JZSo5DG/A3knZHEnEthDOCZ/bMVqtcf2GlJW4ZNb+ugK+99cREF
	 CKbVHh8GSTnHh/Sw8Zmn8yFKtzJbB06jygQ6thbuoImiGjPBx553sThYRgl+tALLryfi8
	 Wr0Ci6TXm5l8aQx3hnjKI3sr0BDfYWXpzfFg78YYBdPcF+HZByNTdPIOLbXDBDUrq0zq+
	 Li+ZchoZdMzDOs2FbGJn3muI9JbB9suEe+D/qmGje6ENTTN9df4Mtab7eV2CnRqfCZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437895;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=q2LLXgfqwD+xrLJorPVwTBLDULLlABEy70l/ShybkrI=;
	b=fzP+uGTutOI1u5zg1ufE3Er5gUoOG26YMcc2TsJECkAJXO5KQJl8JLETY2MEjhJC4Fx7
	 /EWVWY8Th1iEzadV4RnUL1gdAvw5Uey1P9OvSHciwFPbZrlIqtNTK73aQpDwj0x0DecOL
	 U/0pgkfvGFfCJHc7Iag6mdyhcm2j8/ZzcLbummm7CmzlNlTB00pmYIMUUVPqti+wQDFVZ
	 DExckJJFgM11ZEtv20IoEM9uMcSHMf0XbpBIL8O1dQvuQ7eE8jCWMJYWb+KzS5YbNPLkg
	 cUF7ET26Bif0kFol3E9tpOJL1RL46boqV+7FvMgjCQBRTcCRKvWy+pAZMGEwRk2BH8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d4XbwIfa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T3lNwRDm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2861606A691
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 12:44:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2861606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d4XbwIfa;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T3lNwRDm
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANCFwaY301637
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 12:44:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q2LLXgfqwD+xrLJorPVwTBLDULLlABEy70l/ShybkrI=; b=d4XbwIfaFgm/G8Dz
	xl/ht/3kCWRIcMd0XvU5QvDpv2xoviFpVh0bPMuS7EFpE9zcTSDPmdZih/S0RXoK
	T0Zlpg684HmOWajh+tFVV0lVtzpVf1xJXWcLnbc0zQn2zGBFaRV3eUTHyX5gGpjL
	8MHbnsq+62DhuP4Tjn2WCgrEE8Y5p8XRo4NhfLrSUf5fkr7l/4DTcccHoiRoPLLX
	3nSOnupI5viJsIA7rZ/uH3FRwhIMvE4HlBNHGJH+13cIbXkA/uQgxTnqces37Ijd
	5ewwLIJjXgd38wmlt7oBIjDdEmZZcxxJ/7fQeeQfyuHcKrEemjnycNQKqZLIYMcT
	et25Sw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g741dfy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 12:44:52 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-921286add9fso57985076d6.3
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 04:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795437892; x=1796042692; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q2LLXgfqwD+xrLJorPVwTBLDULLlABEy70l/ShybkrI=;
        b=T3lNwRDmBv2qflit4U9ZHSCTKCxynVZBuAwDZVceY0ziElh45jpCiQXofXZrSvKPAi
         R/dHA1qXXnyZYbB6tyKUZu2xmoMdCbeFZl4y8A51VoKL8UjomXTcRmW+Lw+3KAv/mCV+
         Y5301PH/C+b5EDpuqcMYi0JLGiNBMp9d3wC6crGTXGPPe1YCLk6EDMQM4Q844evjfUxd
         j1SAVkgwD76pqW+TJL1lR/GFFG8klfcIJi6PdvqNhgZLow8VQdafRcvjRUTmEnIbJ5EF
         xAaMXFwLsUdRCUkDtdAUwlcWSWpCIRyh6DMhRNCrqUE6mhVdEGwRSk8wbThJCMM1QBKe
         pPaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437892; x=1796042692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q2LLXgfqwD+xrLJorPVwTBLDULLlABEy70l/ShybkrI=;
        b=xoY7sNA6E+mVZF2QNoJTenMgKbQA2D/uoGixDEedns+hU2lxVTri66d0TJFgJRMmqs
         odisR5rVd1V2T360L/gxdy+/IQLK1dwIA7aQQ2EpxKdlCKZdqOmOi2YhyIodHSWv6p6I
         cAuvmMJdS1opFh4dVvanx4UZD0GsaEgiqRmpRCZIGvgJt2oKF3mP144yrsemRQhsbLoU
         CCdfUsASZ+XELmMHsvI2X9LxEYi29H2y5/J7620xXphLvVOPywIQghb6n82xd51zILA+
         LSknZPpVwmXEimxS81s/eM61LLNq86NQ8C8ax7Ztvhkumdt6mPv2lHmvBmLdMSyqe5Jf
         0w7w==
X-Forwarded-Encrypted: i=1; AL+hErHE/vSQhPtJN41fwR0UYpsuk5l4qUwpcokxsbnmO7AYEoV9LC2rtggkANu8xURWAz7RXD1ugv8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hygIVJOcgnJ145q2D0D1j9j9DoEjDTf72u2GGakWMn04fnhM/
	R0UvDrss+zdHbeNZKjgASB7DSDY/D0zL852/+JZC8avv/nxjMaCpwGWTAo6boelqP2X8GUaSCKC
	cx1LPbE15Rqh1zGDUiQ6PJm2VybsYlQb7D34N4uxJIui1YOhHJe4p1PgLbm0=
X-Gm-Gg: AZFdTZfnF79ecAdGuJJ641R9qayFNiX73ktHJlWkeTkIHrY3smuhnbHtKHFIG/dRDmN
	jlDDdCjHe/dnmb222EBTI9+WD2yF9z5DTeabUKlyjVx6jxK2kacd+RyymNtmkr98xrzZL8NHbG5
	Z0fk77xP6ZMTpjyflpqTWgWfN7kPaQJHXhcTZxnM79ZSNjKOKqjsO2agr491moqfeU3YCqmRT15
	nMgUIinEXm0bZBjt+qFA8nvrsuT+YJRT6WjM32VN+StggZPVyEJorRjdzzvC3P4ayCC6ew1u7uN
	U4bo5+zGAR6pZrY8TDEAs+9NzMD3y+mbbr8ZhBNJgAMTjF3Q7QQj3w6WOX+4KiBPXRAFDlyvbqq
	WqdeM/7k9MAQuIbkSQfHlfE7DjjJjO8ebAbvtC0HabvOkHVWTCwIpR2Pk4MrG4o6EPtDfZput8C
	jwByp9m0FDL96svQcSpJQqXcmGjFHgVBRZ4JCce4AjsgNHq5T80GeagYwlPOraEXq29laqKTDzi
	2aOZeoi8OCQfNZys+PiRPCgLQL2
X-Received: by 2002:a05:620a:4493:b0:949:6530:816f with SMTP id af79cd13be357-949ba9fd6ebmr1899082385a.42.1795437891940;
        Mon, 23 Nov 2026 04:44:51 -0800 (PST)
X-Received: by 2002:a05:620a:4493:b0:949:6530:816f with SMTP id af79cd13be357-949ba9fd6ebmr1899077085a.42.1795437891451;
        Mon, 23 Nov 2026 04:44:51 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm649355875e9.4.2026.11.23.04.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:44:50 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 13:44:44 +0100
Subject: [PATCH v13 1/2] block: partitions: of: Attach partition fwnode to
 the block device
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-block-as-nvmem-v13-1-96ffe1f59332@oss.qualcomm.com>
References: <20261123-block-as-nvmem-v13-0-96ffe1f59332@oss.qualcomm.com>
In-Reply-To: <20261123-block-as-nvmem-v13-0-96ffe1f59332@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Christoph Hellwig <hch@lst.de>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: qg5aYL0ewr5aiI-xk3ZHM2p-cxTmELmA
X-Proofpoint-ORIG-GUID: qg5aYL0ewr5aiI-xk3ZHM2p-cxTmELmA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1MCBTYWx0ZWRfX3pTp7tx48Qny
 N8TO6DcxZK5kUrLPWDH5DYdns3Cu0VNF/sDn8RH8vRpF1HEPcucwOxD65Fpgix4MtoGL5Nuvuep
 jXJSkKjo5gNFGawTmWXKGiUG4c08SIQ=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b043544 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=_IYX2gaGVZBpxN60pRUA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1MCBTYWx0ZWRfXwKDglwF6ecox
 Jz9RT2v7BfUfa1TIY49uDa5y7V7BWXNHPA3akS36SkwUhih34bo2KrBaTh6hmO793NdS1aamULK
 fD7qKuidkgEQCHBmopc/HMnZsCYNDQp8o7AVeqIbh+lvtJq+2DXT2lITS0Ys6MlaBf4d4/F8B1m
 OqUudz/gjD3HCKbb4wNtRxUShYzva3mHofTzMGXtE74DRARCtjXDXXqD1GKnJOvjAlBWRhfB6Q+
 t63nu9fxgOIbqJVrcIg3381ugNmFAVI8jJ0sKtmEu2Tl2LaN/LpoYXUXgN6QUCq7yOAdMl0eFd3
 /jV/O+jrpn44E468/XZBq5y5awQir7rqaG8zgCcuWQL2Z3LpBgnWFzCUGKycJE6emKLecrBH0ce
 gC576k3MVomz5KakwkTfdDhaQAMIggZHl0gpvhQvPVAovmgBzGnxWCxReuhQ+ncENx6pG7fDO6P
 M3UpDHgoCJfTPVYgFFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230050

The OF partition parser reads offset, size and label from each
"fixed-partitions" child node but does not associate that node with the
resulting partition block device. As a result a partition has no
of_node, unlike the whole-disk device which gets its firmware node via
add_disk_fwnode().

Carry the partition's device tree node through the parser and attach it
to the partition's block device with device_set_node(), mirroring the
whole-disk case. This lets consumers describe per-partition properties
in the device tree (for example an NVMEM layout on a partition node) and
look them up through the partition device.

No functional change for existing users, partitions without a matching
device tree node simply get a NULL fwnode.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Ulf Hansson <ulfh@kernel.org>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 block/partitions/check.h |  1 +
 block/partitions/core.c  | 20 +++++++++++++++++---
 block/partitions/of.c    |  3 +++
 3 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/block/partitions/check.h b/block/partitions/check.h
index b0997467b61a54a8a621b9c155c8329289649460..326081499d9a6be730dbd659c110449cfa06921f 100644
--- a/block/partitions/check.h
+++ b/block/partitions/check.h
@@ -17,6 +17,7 @@ struct parsed_partitions {
 		int flags;
 		bool has_info;
 		struct partition_meta_info info;
+		struct fwnode_handle *fwnode;
 	} *parts;
 	int next;
 	int limit;
diff --git a/block/partitions/core.c b/block/partitions/core.c
index b5c59b79ca7cbb28d4d93478ee1c80908f76ee9f..eee954df1ac6ef7dd4f02ad5c9d49aed778bf015 100644
--- a/block/partitions/core.c
+++ b/block/partitions/core.c
@@ -11,6 +11,7 @@
 #include <linux/sysfs.h>
 #include <linux/ctype.h>
 #include <linux/vmalloc.h>
+#include <linux/property.h>
 #include <linux/raid/detect.h>
 #include "check.h"
 
@@ -110,8 +111,17 @@ static struct parsed_partitions *allocate_partitions(struct gendisk *hd)
 	return state;
 }
 
+static void drop_partitions_fwnodes(struct parsed_partitions *state)
+{
+	for (int i = 0; i < state->limit; i++) {
+		fwnode_handle_put(state->parts[i].fwnode);
+		state->parts[i].fwnode = NULL;
+	}
+}
+
 static void free_partitions(struct parsed_partitions *state)
 {
+	drop_partitions_fwnodes(state);
 	vfree(state->parts);
 	kfree(state);
 }
@@ -139,6 +149,7 @@ static struct parsed_partitions *check_partition(struct gendisk *hd)
 
 	i = res = err = 0;
 	while (!res && check_part[i]) {
+		drop_partitions_fwnodes(state);
 		memset(state->parts, 0, state->limit * sizeof(state->parts[0]));
 		res = check_part[i++](state);
 		if (res < 0) {
@@ -247,6 +258,7 @@ static const struct attribute_group *part_attr_groups[] = {
 
 static void part_release(struct device *dev)
 {
+	fwnode_handle_put(dev_fwnode(dev));
 	put_disk(dev_to_bdev(dev)->bd_disk);
 	bdev_drop(dev_to_bdev(dev));
 }
@@ -294,7 +306,8 @@ static const DEVICE_ATTR(whole_disk, 0444, whole_disk_show, NULL);
  */
 static struct block_device *add_partition(struct gendisk *disk, int partno,
 				sector_t start, sector_t len, int flags,
-				struct partition_meta_info *info)
+				struct partition_meta_info *info,
+				struct fwnode_handle *fwnode)
 {
 	dev_t devt = MKDEV(0, 0);
 	struct device *ddev = disk_to_dev(disk);
@@ -343,6 +356,7 @@ static struct block_device *add_partition(struct gendisk *disk, int partno,
 	pdev->class = &block_class;
 	pdev->type = &part_type;
 	pdev->parent = ddev;
+	device_set_node(pdev, fwnode_handle_get(fwnode));
 
 	/* in consecutive minor range? */
 	if (bdev_partno(bdev) < disk->minors) {
@@ -449,7 +463,7 @@ int bdev_add_partition(struct gendisk *disk, int partno, sector_t start,
 	}
 
 	part = add_partition(disk, partno, start, length,
-			ADDPART_FLAG_NONE, NULL);
+			ADDPART_FLAG_NONE, NULL, NULL);
 	ret = PTR_ERR_OR_ZERO(part);
 out:
 	mutex_unlock(&disk->open_mutex);
@@ -564,7 +578,7 @@ static bool blk_add_partition(struct gendisk *disk,
 	}
 
 	part = add_partition(disk, p, from, size, state->parts[p].flags,
-			     &state->parts[p].info);
+			     &state->parts[p].info, state->parts[p].fwnode);
 	if (IS_ERR(part)) {
 		if (PTR_ERR(part) != -ENXIO) {
 			printk(KERN_ERR " %s: p%d could not be added: %pe\n",
diff --git a/block/partitions/of.c b/block/partitions/of.c
index 53664ea06b6540e3d1155141adaafac7286f2d21..4fc7c80c407de42b2b31be2c82e0e6bc2a30c9e3 100644
--- a/block/partitions/of.c
+++ b/block/partitions/of.c
@@ -3,6 +3,7 @@
 #include <linux/blkdev.h>
 #include <linux/major.h>
 #include <linux/of.h>
+#include <linux/property.h>
 #include <linux/string.h>
 #include "check.h"
 
@@ -62,6 +63,8 @@ static void add_of_partition(struct parsed_partitions *state, int slot,
 		partname = of_get_property(np, "name", &len);
 	strscpy(info->volname, partname, sizeof(info->volname));
 
+	state->parts[slot].fwnode = fwnode_handle_get(of_fwnode_handle(np));
+
 	seq_buf_printf(&state->pp_buf, "(%s)", info->volname);
 }
 

-- 
2.34.1

