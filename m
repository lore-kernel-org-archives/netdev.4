Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827704;
	b=0zhkRUV6HeNhtCVZS6q2lbl1QPYwAnqDtPs95nJCHn1vxuET6EEe7CxIoICRYYVBWqpG
	 u9xXp9AEqq5+cSJdZNI7unz0UE/Za9lbQPZO6bI+BHqIpIxe5A/Zkli2xugbgFXTqn93h
	 0P1IajkL3/lRXTAEgL7/Qa9mhwNbO2ER0KQMZn5qIB7xHw4GvAz7QPbvP1C1YOE/UC5q4
	 A0Fksk4yeD+K5vnb4c7w6AG9Wu5Mcjhoj4c/wW3LhxwLikEOChesAKqkxp12Vx5mydxPx
	 lUB1fCaYVMCz3UA5Xollh/n5LKN2sq1hotXFJR1hJlMPmnur4jt2Nil8AUCeLojgZeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827704;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IAjtc0pUcTl0VrMDeM3Ho8z5856658sgT1HmtqT10jQ=;
	b=z1BKTxniQYwgAJT0npygPddKGmBlnVYe4msgenaaEQuLFjDFf5kE8xCvSZgpaRv3u4PD
	 iwYd1aaP/J9T4bBVELjFjv+UINoW/BVt/n/6fDOxmm1etDTAdM+PlzQUhWw0UcZvZuQ/n
	 6kzoKwQmvx8sS1yjcH3LpfL/eJ264mI+Dpx+sP7YRIlwSAEtTZbuBl4z/lzVUysis0VBQ
	 9y3YbE+qZCNF+wVaQOLUSknKoX11z1HFbPx9EcwokaTX49wWLfbD6gGzgtSwUnBiZCe2w
	 xtGKFOh0tdDH7HxDJTlaArNQ6eLQ/wdl4NZCt5WR0pFwhVf+7WN+x+w6Mmp4MSCA4/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pgQIeSiB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fFVFbzg2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6C3606BD1D
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 11:15:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A6C3606BD1D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pgQIeSiB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fFVFbzg2
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG9POZt3427960
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 11:15:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IAjtc0pUcTl0VrMDeM3Ho8
	z5856658sgT1HmtqT10jQ=; b=pgQIeSiBYZFkXOhMZd2k2xDg9d8jHeuaB7FJxI
	Blo4uSWDzr4+AcLSWa1NjbhZaZGiB3UQVUggJUO/7pZWBSW7l/IqBucYrXk3Ct/t
	SbAm5vV0wq+hKTD7wTd400kt2R+tkRIu1m0Y3cVcGuwu86HJPMFYjSEXjvBq5WpY
	AybUTJ4ruA9cZzOPvY4VaV5nwtFv4bqtyOE1B4kZXP+NLHBcjmi2u6tYxL4znpdO
	5gZubo0n+gjh+M5/hnmo2xb/em3LQrkFDBm82eyLTG+VM/bHVEbGXQNhE19bXjvN
	PMb/MnD9JVpN1JwWQuW2p5vTAYoPNzedW/h2AXZV3Ad+kiIA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyy6ggc96-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 11:15:03 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso4885633eec.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 03:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794827702; x=1795432502; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IAjtc0pUcTl0VrMDeM3Ho8z5856658sgT1HmtqT10jQ=;
        b=fFVFbzg26GTSx1xhCAcuhdvNPUrH91NKo5jVwCQxqyZWunUSqvvVbKsSzNc2NIWzW0
         czuKzrk0w0XQHZ40R34vvT6GNpMuHYjAVeQ06qA11mjN3/OblB/Bbul+9twlJdg78ymn
         obdB+L/i6VDNXi2+SR89S4Cl6fUl7rapfegpnszFfWNcBirGYOKJ2fIyFSi85ZffRP43
         vaHUbNNReChC2e1OFO/7Dsmm+Opyw1zToq3V0FGHfiUU8aDQhua279GUZSv3ipy+Dc6l
         WfVISxB89l3UGWExqQQEk0G3PMTr8yWOGkw9GIhd1BwZ3Z8qu+I35Mi9CWDZH2Fkm7Fi
         Ml0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794827702; x=1795432502;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IAjtc0pUcTl0VrMDeM3Ho8z5856658sgT1HmtqT10jQ=;
        b=o+NSIy6+PLbu2Wmi/Anzk+qo2jqy89R7DSKZPA+gQuYuXdVKZYhdlwUKXaM/8buuKY
         usSUSpVrZnFllB/HHU4K4tJ3Tdfr+K0fIvyYr2kReGyTpuKpUA44IeczpRRaro9PJual
         GY5o49voAgWCB1E1NqbktgXR7IT54N6aYRF0WQRAy1OApPZtY3+IkbL4pVowu/HNUKZG
         f+u9cao+9cyUQVF6qHiZQSwao6m3zHMzbggjkmgU8EzWSUX03z2ByVKuXdUSWysUC14B
         BNaRkdnlI0AgbF1qzeykhVsY3gJajHWJ8yBrB032mUXjb5Km5y9tZ8uuLO2d1HIJ9mlX
         tkAQ==
X-Gm-Message-State: APuU4Z/QmWlvdtmLOFByJs3+aGkxiSAof0smQC5vLCVflkngIG14cjhg
	rwmPtYJ3D2kg6mpBt+gvMzM1pevjoF1AYXMpHWUftGdW2ZPkvnzqMcO+UspUUQH2jaFMJCNBHzk
	mFRiF+CPkhv4GZU3YgbrG6fcnJsAbUNR8dCMnheX13IIjDA0PPqx2HE9sjG0=
X-Gm-Gg: AYBFou30Qi/NypifG6wsGVX9x42naE2maHG3R/aYYAxpoPSKhvB9r1mh5r2DB6+ULSC
	KqUoIHCD6Lr/FJnRDevUTFCo+dWAwDOpFO2AjPNAwghC9ADbN6K2UIgTSIheEAvRbxrlqtBp3ui
	Oo+AgART94PetlE2WEueY/gPqEpGvVVspmK9t1eNXeF1PwYJBUx0WYIAto3G94m81YdBxIp7JKF
	bMCJJ3MRDv3jwO8wVERecewaeD2p8t9HLO+iFQo6s8hGOMkEUhMQtkGHv1cDxYqdfuvJwRYL1iZ
	g5UqfTUJouck9YOcZ1UJ9vcIPQm85aWuCLKIAsX0TA37ZKHeQTdcv76rJkArYUAlZCy9RjblkMO
	SO6GGMfYj7TMcE3hBYmYMGaGjR1VveZJpwghVNtqYFNr9uV1lciuvaqRLdo/fs5fheVfZ3ViS9P
	VPsddq6NjmzqtOtKIP67vVyVfNUDpCTqos
X-Received: by 2002:a05:701b:2044:10b0:15b:7f7a:730d with SMTP id a92af1059eb24-1b5031152c3mr10499606c88.28.1794827701822;
        Mon, 16 Nov 2026 03:15:01 -0800 (PST)
X-Received: by 2002:a05:701b:2044:10b0:15b:7f7a:730d with SMTP id a92af1059eb24-1b5031152c3mr10499574c88.28.1794827701118;
        Mon, 16 Nov 2026 03:15:01 -0800 (PST)
Received: from alfred-sh01-lnx.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316e008sm31439624c88.6.2026.11.16.03.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:15:00 -0800 (PST)
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 19:14:50 +0800
Subject: [PATCH net-next v4] net: phy: aquantia: Poll global status
 register for provision ID
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
Message-Id: <20261116-aquantia-poll-global-status-register-v4-1-1b44fe85db5a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKnl+moC/43OwW7DIAwG4FepOI+KEEphp73H1IND3JSJQgcka
 lXl3edkh+2wSQHJkoX9/TxZweyxsNfdk2WcfPEpUqNedsxdIA7IfU89k0JqYWXL4XOEWD3wWwq
 BDyF1EHipUMfCMw6+VMy8N1ZrUBoPumdE3TKe/X2NeWcRK494r+z0/VLG7gNdXVKW2QsRKT/WH
 03NurGEN0LabeFTwxtuBF1rpIK2f0ul7GkzuHS97qmsyZP8selstCXZnRby7I5oBNh/7Pa3LTf
 aLdnOiINWR9CiU3/Y8zx/AeKHQtGzAQAA
X-Change-ID: 20260923-aquantia-poll-global-status-register-d8966a46e56d
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>,
        Hongmei Xu <hongmei.xu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794827698; l=5228;
 i=hongmei.xu@oss.qualcomm.com; s=20260917; h=from:subject:message-id;
 bh=SXUQOsTVCAtqvBKmT5VAyRs1qMJy2jkDDC2BygNoL6g=;
 b=zk5zxmWCR3JwP0takVxBSzu+EnjGqV60Eo7NqY2Tf5AT35uGQo1YFF2/tsgMdwFOkpUiDMyGP
 zDWM01cYTboCbpYzxDru0rSrpHafyVowReVNhgFlLNKGIR0/tV+Up/B
X-Developer-Key: i=hongmei.xu@oss.qualcomm.com; a=ed25519;
 pk=8J3IzbyuOOHSwLvktng8AEQIdStEQDAGNCSOlkASmk4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0NCBTYWx0ZWRfXy4eT3XIcJ8v/
 EySEGnb4ZhUXTFDqLDQ6aFN7lMcgw9nTwAKsH2yWSivmVGu03frFvL6MrVGdUA7tS7JkRe34H9c
 2AD2M/BGXBmgvMcPmomEX/Rc4lmMvscdjZMAY8y3TLyXXxIPy9ftqGGEwltnjvbvX6YcoRz6RwB
 9qsrTRYo+bqFYOOt8GrExsfFkN1+sl7i6xVAyz21oRVFcSaHK9Tp7nSj8w7zWLIz9d53HJfxAru
 NySji+AbrwAgoOo0V51POyVzZ1jK3pG07SFzagGj1iA9xT9L1ThV7FT8KQZwGHS5haHuwMNhKnp
 BPB98KGAmm+U6RX5qnSgiaD6CJPd5EAv37qfpy/IKQP3ORmuoNxQP/3zKPA0N1GH/EM36uZhwuG
 LSskWzqUgVPuEBtPPXnuu9TER6A2zwa5dcuJIJAumEyiWtjr5p5R2+Acb7u9XFfPfF2AveVVKQp
 GhKLGBs4+e3jhkyqbRw==
X-Proofpoint-GUID: C7yPXpgfMYH9gmAhSg4Q_eHeK5woGJbj
X-Proofpoint-ORIG-GUID: C7yPXpgfMYH9gmAhSg4Q_eHeK5woGJbj
X-Authority-Analysis: v=2.4 cv=D/DSufRj c=1 sm=1 tr=0 ts=6afae5b7 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=82E38TOJ5-ceWuS3CJ0A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0NCBTYWx0ZWRfX0FavCzubcbh+
 RHH7fH1x/tVYWi8nrR7iEmO4237Ch0fJ8Vlm5rXm9AK6fhSVEw6nbLulIuKREG6EInmQV78Dc40
 xlwlrVrzA8iTHL+EquW1jb0a6Rf1J0w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 clxscore=1015 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160044

According to the AQR113 PHY databook, after firmware reset, a 20ms
timer needs to be engaged to allow the supplies to settle prior to
allowing the PHY to boot. The working flow is:
  -After the 20 ms timer has completed, hardware state machines
   designed to guarantee PLL and band-gap stability engage.
  -After the PLLs and band-gap are locked and functioning properly,
   the processor and digital circuitry are released from reset.
  -The PHY image is then loaded through MDIO boot-load and the
   processor boots.
  -After the processor boots, any provisioned register values are
   set, and the PHY enters the provisioned operating state.

Starting subsequent firmware operations before the provision ID is
valid leads to steady link failures; this has been observed during
AQR113 PHY bring-up.

Poll VEND1_GLOBAL_RSVD_STAT1 on AQR113/AQR113C until the provision
ID field is non-zero before returning from aqr_wait_reset_complete().
A timeout indicates a hardware-level provisioning failure that
software cannot remediate; the warning is logged to flag the hardware
problem, but probe is not failed since a timeout does not necessarily
prevent link establishment.

Co-developed-by: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
Signed-off-by: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
Signed-off-by: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
---
Changes in v4:
- Limit provisioning ID poll to AQR113 and AQR113C via
  aqr_need_provision_id_check() helper to avoid fixed timeout loop
  for PHYs who has PROV_ID=0 as valid value. With this change, it also
  avoids touching the existing logic for AQR412C interface mode
  selection issue which is out of this patch scope.
- Return MDIO read error instead of warning on VEND1_GLOBAL_RSVD_STAT1
  read failure
- Update aqr_wait_reset_complete() comment to mention AQR113/AQR113C
  provisioning ID wait
- Link to v3: https://patch.msgid.link/20261112-aquantia-poll-global-status-register-v3-1-c805647a60b4@oss.qualcomm.com

Changes in v3:
- Merge split string in phydev_warn() into a single line per kernel coding style
- Link to v2: https://patch.msgid.link/20261111-aquantia-poll-global-status-register-v2-1-b602fc7e80a9@oss.qualcomm.com

Changes in v2:
- Change the log when provisioning ID poll times out to hint the
  mode mismatch possibility
- Update commit message to describe the AQR113 databook boot sequence
  and explain why polling PROV_ID is necessary
- Update commit message to explain that timeout prevents fingerprint
  construction for PHYs like AQR412C with MUSX firmware which in a result cause mode mismatch
- Link to v1: https://patch.msgid.link/20261029-aquantia-poll-global-status-register-v1-1-808089824a3d@oss.qualcomm.com
---
 drivers/net/phy/aquantia/aquantia_main.c | 33 +++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/aquantia/aquantia_main.c b/drivers/net/phy/aquantia/aquantia_main.c
index e95d391a6dc2..a5bba9be0d06 100644
--- a/drivers/net/phy/aquantia/aquantia_main.c
+++ b/drivers/net/phy/aquantia/aquantia_main.c
@@ -681,12 +681,24 @@ static int aqr107_set_tunable(struct phy_device *phydev,
 #define AQR_FW_WAIT_SLEEP_US	20000
 #define AQR_FW_WAIT_TIMEOUT_US	2000000
 
+static bool aqr_need_provision_id_check(struct phy_device *phydev)
+{
+	return phy_id_compare(phydev->drv->phy_id, PHY_ID_AQR113,
+			      phydev->drv->phy_id_mask) ||
+	       phy_id_compare(phydev->drv->phy_id, PHY_ID_AQR113C,
+			      phydev->drv->phy_id_mask);
+}
+
 /* If we configure settings whilst firmware is still initializing the chip,
  * then these settings may be overwritten. Therefore make sure chip
  * initialization has completed. Use presence of the firmware ID as
  * indicator for initialization having completed.
  * The chip also provides a "reset completed" bit, but it's cleared after
  * read. Therefore function would time out if called again.
+ *
+ * On AQR113 and AQR113C, additionally wait for the provisioning ID to
+ * become non-zero, indicating that firmware provisioning is complete.
+ * Without this polling, link issue can be seen after phy boot.
  */
 int aqr_wait_reset_complete(struct phy_device *phydev)
 {
@@ -702,7 +714,26 @@ int aqr_wait_reset_complete(struct phy_device *phydev)
 		return val;
 	}
 
-	return ret;
+	if (ret)
+		return ret;
+
+	if (aqr_need_provision_id_check(phydev)) {
+		ret = read_poll_timeout(phy_read_mmd, val,
+					val < 0 ||
+					FIELD_GET(VEND1_GLOBAL_RSVD_STAT1_PROV_ID, val),
+					AQR_FW_WAIT_SLEEP_US, AQR_FW_WAIT_TIMEOUT_US,
+					false, phydev, MDIO_MMD_VEND1,
+					VEND1_GLOBAL_RSVD_STAT1);
+		if (val < 0) {
+			phydev_err(phydev, "Failed to read VEND1_GLOBAL_RSVD_STAT1: %pe\n",
+				   ERR_PTR(val));
+			return val;
+		}
+		if (ret)
+			phydev_warn(phydev, "Firmware provisioning ID not ready\n");
+	}
+
+	return 0;
 }
 
 static int aqr_build_fingerprint(struct phy_device *phydev)

---
base-commit: 944ae66642b726bd6b25ae71b1e9ff88a0e0bdb0
change-id: 20260923-aquantia-poll-global-status-register-d8966a46e56d

Best regards,
--  
Hongmei Xu <hongmei.xu@oss.qualcomm.com>

