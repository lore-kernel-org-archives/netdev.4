Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795478660;
	b=o5MbK1IXRW/TCYTANOt5edLkvp44JYsT29Ui60QcAJyc4csdXAe42DiodgeaQDAfkOHP
	 hpP5QIDn3tKWTIaLx37FfKqyRw7e1W4hVNaZHvOMLs2SRdWcJ6Xa9yXx5Pe26Y0ciZdrC
	 a4C1EEtTbTEYAWxDd4hv23MTh7CsZbBd3j9QGF/HAz/jKJcXIaf+NfOfdJ5MyIXXjmjF5
	 6EHyrjbWuImTYEpqbJ/DYfhMJXO4moLoeQ9fivTl6FrmmjpFa72+fgG8PM94BPfRAgLmb
	 K4sg8eX07VwnG31+xIxvp1f5UoUQ9Pk3KbE2GjiDNSCN5HHRWk4XvZNPYfAgCdc+7wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795478660;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Qm1RQNetAuFgXdndilb+UqjdnHPgEpFGABMCjzlVzYU=;
	b=hIBKPSiptP+qc18FCEgDxwjOAUqfXSlUizxTqkDsfh2MdHupELQXOJBqorovNP1KelC9
	 QkOrZXwp1m1YC2rbMq92MK8MZPCvCCoifFZhNHn/eCeWcVoPCIk1rdsOVryNi7ePWlqtY
	 6puXnrs1gsyOl/VNQFABOpvJd+S9wPYWkoj9wikg2Wq/lYZmbwlhIxvQ6wHt0SedhlcBY
	 LGyt1vkvJi0ScNHGnkg+g2HLm+WZgaInLAOLG01JwaSoN9pT/5YHYOctzvlNfL1a0ako6
	 yaxTGH7Wzkadj2FiegNhaAIYXUufS0lEMEyxryX8oSS2bxDxOPkJsBibouZppWe6Irw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WsuLAtoB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WFXVrNQc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F089606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 00:04:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F089606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WsuLAtoB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WFXVrNQc
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJupjQ2862090
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 00:04:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Qm1RQNetAuFgXdndilb+UqjdnHPgEpFGABM
	CjzlVzYU=; b=WsuLAtoBPvFCnvZOFiNOb7w6/tgENSRqbkGK8bz8EXAvevvza7f
	izgoRuO7tjbvhGrZvBEWOAq7uqjWK/2R8W2eFbEWnZ56JIJmgM+L289khjFsVPZH
	kaIV838m6IqVtnV9/MJS6BMjBhA0B2k/erOxB0tXLHtVS/qDBGZ6WgF0RRoJOVgu
	0cpG3XnUvxc+yuHJoZNfhWUwu/SPrxtJq96kZ/mrAHwOpKYzhw4TR8R9myOvQ82S
	yRPfT+5CGNfzpNNyj1AnbxpzGw9dGEbCiAyB6NouuJz3JF2FsMlakHsr9Zuu3e1A
	ooG2vOuyPkjC8MmvlgTHMK5Eorw4h/nhNhQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4m7utyhp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 00:04:18 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33713e5e6daso6950194eec.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 16:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795478658; x=1796083458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qm1RQNetAuFgXdndilb+UqjdnHPgEpFGABMCjzlVzYU=;
        b=WFXVrNQccPNkigzXQzLWbI62bprrTJ2FktkZZV0txywu0DjRYx1Tl6gCP7c5LzGvZN
         k/1G3nKh701ShcRjIYvUUwR92HUBZtH2WwcV5ktZWTOTPG4o6BjRi9Or3+7yFSWaO1JU
         v0wJHbrRY8fzYvpNIRzrgyp04ZJNPgxbiyw6z0tfKySAci/t7DFRS5jT5FLn2/+HNo9u
         K6IH23fpiPloUmGpXDUidXRqPxakiRP+s5FbO/63yXaLg6LxjRh60fkrxCGIv3vKChIs
         PZr41bMUz8kj7N38RFBuNUsSgQSH2lYYOt3OjZzCebfw7qNC5m7O+ouJK4Se/scAHT5+
         16jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795478658; x=1796083458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qm1RQNetAuFgXdndilb+UqjdnHPgEpFGABMCjzlVzYU=;
        b=zy8HHJssU2rpzyr1qbKLAaUBouYw3d42vChiT9yuQ85hNSE9nzAPhZnhot+zbNpVGa
         w1SbvPnY0tNbywW6W6IGrhfRPQIXCyPArDZwzyz1BNvMja6WWRBklqLqWk1vVvJpV0JU
         Q9jfRAViRNNgDnvHufzQ5tOyj/nQd2UFhNr+y+c1OyNiGudoCEUjUNVMMI02cGpEs31H
         A9w6K9mbm12vD6zN27FrcPe1wMOKUVS/SaTlGUA+YOPJGl7EtSkJAiUnPMX1Mn6wWJ42
         6cfjwAHl86DkaeGIg5tVgiSBFl10MZz0kFKsTCAQ34nJrWuloBMMiuo1tHmXroyfgzjb
         XyDw==
X-Forwarded-Encrypted: i=1; AL+hErFCUJ46pn8/M7abtpPNiws44RoHMqjH41y34tK7AATzfjFngOwMgTPqXxx66mR4vE49KoqaJXA=@vger.kernel.org
X-Gm-Message-State: APuU4Z99rwYvnze89Tw8oPAprsizTC5NyJTKwodMum9XCclWrNnmHjWu
	W5r9+44X8gSX6XPJZBVzSrrKe12gpQZF05TslRYoNaiQaKxdlNNI8PSW/aqX9XMyr6SeI0Vu65i
	QGwMGKIYRdAmZtDMoApdl65xHgndgD4W6H1pwKs6oqGre3IA2a+WpfH8apZk=
X-Gm-Gg: AZFdTZcEwDM0l3PurxwsWIDpAHtjslVUdHGJrZ5OxZ+6ps/gaNSs7D7Fy1Mx7cUC288
	wWmkhjpT6afybY/JhGmJInsOhHUzwrxWlHDRrEjnbeIg+UuA86lhAWR1/N5GtfvBZGtydn8luZd
	SFVYQQBmOIm6KUVz3aP1diM2kOWVaZj2mIT6+OhLpdbu0TA3tribQ761AHZlc/2ZeFt9veosaw3
	Yjc9grVZMCsumJIb/SR6RDnE74fyULnWSYm5e3UrsyliME3pLvv69NnNV+8v0tuhZRZxjZuMluw
	2XnK8dEYC/JzLE8W2wptNXCKcsGetUEy96Fp9OTq+CFi9ahKy+iTDck6rq0Uso1777wNUZNr8ht
	KbMSThtgmPf70agCwFRSCzMrpLWSDckTRS899o/EDdKqqsx+raFmdBS3drnio1YSb3byt2MFOFq
	k5qg7rSaLJq7kmfPGjryBDJKNEWp2Ew+QX+10=
X-Received: by 2002:a05:7301:4281:b0:386:a193:9afa with SMTP id 5a478bee46e88-386a1939c38mr8920255eec.11.1795478657507;
        Mon, 23 Nov 2026 16:04:17 -0800 (PST)
X-Received: by 2002:a05:7301:4281:b0:386:a193:9afa with SMTP id 5a478bee46e88-386a1939c38mr8920228eec.11.1795478656983;
        Mon, 23 Nov 2026 16:04:16 -0800 (PST)
Received: from hu-scheluve-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm41662125eec.6.2026.11.23.16.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 16:04:16 -0800 (PST)
From: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
To: j.raczynski@samsung.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, cs0617.lee@samsung.com,
        k.domagalski@samsung.com, k.tegowski@samsung.com,
        abhishek.chauhan@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com,
        sarosh.hasan@oss.qualcomm.com, hongmei.xu@oss.qualcomm.com,
        sagar.cheluvegowda@oss.qualcomm.com
Subject: [PATCH net-next v2 0/3] net: stmmac: support up to 16 MTL/DMA queues on XGMAC
Date: Mon, 23 Nov 2026 16:04:12 -0800
Message-Id: <20261124000415.4067701-1-sagar.cheluvegowda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-ORIG-GUID: NAdtAq3PoZZrCNjcugbHX_E4KkWjK_3L
X-Authority-Analysis: v=2.4 cv=KurYSmWN c=1 sm=1 tr=0 ts=6b04d482 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=hD80L64hAAAA:8 a=EUspDBNiAAAA:8 a=j8eSvQKXAAAA:8 a=fBzlRZiCmRc88xsmlxcA:9
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=j1SoD6Fdrn8k65qUt67a:22
X-Proofpoint-GUID: NAdtAq3PoZZrCNjcugbHX_E4KkWjK_3L
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA5NSBTYWx0ZWRfXw+3s8zFlEaCC
 lLtoht85rXsjW394pBWTUy3kfhUsTGBH8TC3Yqrdf/JjCOccJay89BMtM0Oqs6r6RQA/2Hf+XtP
 BlN06Ja0K1mDho8h8Z7g6w2yw071CBQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA5NSBTYWx0ZWRfX1m4ZBWXTLWPr
 M8aGX37JH07vppaf4SNXnBPGYjiomC9mBFyUjt5v3ExDBxyf9rjJka95wQoJcreBfY0/MIAvlg+
 FtM2haYTSclKfnV2NMEpTLFXLiSz+lDhw+Kt6YsAFtR0mdEXFa+qfJVR6UfqZiqlXMzm14noaDM
 X1xO4d0UHmk+r2U6x9xWP+QWCajvtSz647p4yHp2vscj+ryJoIkOMXuJHpx7VwiuhMC4aTsIqLQ
 r+jr+ZBR4+uwV5aodQ+kaeYRAo8xZOlqcPnaG6MT/IJJyHLomPYNGc+VX1AQicW5JnNDoTrxQuH
 kZj5FvDmwsroXCk48yybeNX4Cfy99iDG3yO9XhNZvImtHmOXfaERkKFFdCgVQmif6KAVW/Xz/UW
 sN2F/wqlygsgJFq7dzqAr1KzQHtJKIqkXzdtvvq8Ndjm1nqPHpNPCk8/XeiBQseDjstZ3m3lxJw
 oGgqI6ma1zKM0RE5PpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230095

This series continues Jakub Raczynski's v2 series "Extend MTL/DMA
support to 16 queues":
https://lore.kernel.org/netdev/20260601162537.553512-1-j.raczynski@samsung.com/

Newer XGMAC hardware can have more queues than traffic classes: Qualcomm
Nord is a 25GMAC-based SoC with 12 queues enabled (the core supports 16)
and 8 TCs. The driver assumes one TC per queue and bounds every TC
register write by the number of queues, so the DMA/queue count and the
TC count need to be separated before the queue limit can be raised. This
was raised in the review of the v2 1/3.

 1/3: separate the TC count from the queue count. Bound the per TC
      registers (ETS, CBS, weight, TC_PRTY) by the number of TCs and
      the per priority registers (Qx_TX_FLOW_CTRL, PSRQ) by the 8
      priorities, and do the checks in the callers so that errors are
      returned to the user. This is a rework of Jakub's v2 1/3.
      tc_setup_cbs() is not changed: CBS offload on queues without their
      own TC needs the HDMA support, which is not upstream yet.
 2/3: extend the RX queue to DMA channel mapping to 16 queues (MAP2/MAP3).
      Jakub's v2 2/3 with netdev_err() replaced by WARN_ON(), authorship and
      sign-offs kept.
 3/3: raise the maximum number of queues to 16. Jakub's v2 3/3 as it was.

The review of Jakub's v2 3/3 asked whether the other cores, whose per queue
registers only cover 8 queues, could now be configured with more. They
cannot: stmmac_hw_init() already limits the number of queues to the
count reported by the HW feature register, which is at most 8 on those
cores.

Changes in v2:
- v1 was the MAP2/MAP3 patch on its own:
  https://lore.kernel.org/netdev/20261016193823.2711773-1-sagar.cheluvegowda@oss.qualcomm.com/
  Following Jakub's review of it:
  https://lore.kernel.org/netdev/atXhR0sgdW84YxcQ@AMDC4622.eu.corp.samsungelectronics.net/
  - add 1/3, which splits the TC count from the queue count, as Nord
    has 12 queues (the core supports 16) and 8 TCs
  - add 3/3, which raises the queue limits, so the MAP2/MAP3 mapping
    in 2/3 can be reached
  - 2/3 is unchanged


Jakub Raczynski (2):
  net/stmmac/dwxgmac: Extend MTL/DMA support to 16 queues
  include/stmmac: Increase max DMA/MTL channel count from 8 to 16

Sagar Cheluvegowda (1):
  net: stmmac: separate the TC count from the queue count on XGMAC

 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  3 +++
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 23 ++++++++++++++++---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  | 17 ++++++++++++++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 22 +++++++++++-------
 .../net/ethernet/stmicro/stmmac/stmmac_tc.c   | 21 ++++++++++-------
 include/linux/stmmac.h                        |  6 ++---
 6 files changed, 70 insertions(+), 22 deletions(-)

-- 
2.34.1

