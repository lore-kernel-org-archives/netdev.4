Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794660376;
	b=R1tio7i0TMwe8JjdW5t3lfZ7aykF21l/p6hCrJSPjM+LGjFHlyTTZrA1HH3f9hMEOcqj
	 9hUo/QaD+6etX5UsyfVWxhYy9hfChiY1me3TitZjHGB6WSYXVFByuMLYD22qnCKExZLmK
	 GGbISdcF60j6s8m4yWPU/y4OIu5QwaeG9RqgjbxfmYv9QmjUFjsIc7JL3DhXR6F+3ffu+
	 v82Au8CjMkBjThulW4MPoaoB87mv1vK4QaPkh9RESUmOOut6UTwliLFgjMsl6Q6Q66Qci
	 zVx/0n/HSufCcyRopGbMNRgT7sWQj/vQwnsLuZfp6RUoKc/z3QvAPEBt0+w5WHbKWpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794660376;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Sm2zRheHuhx9Zfz6c0YchR95H9wicGcjsIbHYljiQzg=;
	b=AXfJuBpEfjZ/6g8spRdsbKI+V9CBNHc3ZuQago9Y24xqxcVPS0Noilc1nRi2T0yQiPLA
	 yU+AJmXmLKDBL8FRv/hkOdCAvDoqkZYY90AEzJhr1lGmS4vrmTRpFi/ftqOReqYBqmZef
	 hlH7XSkpvImY9yFoiHDv+IWawA+KZzLLeQrFk+V3ycbtBy+q5FmY1CjIjI/YID9I32u5+
	 HfncNKOeBbadaN1YzdERF6sxPnt/ZYNAazUxYHmcCBoD52M9DBho9YKMC9G8CeufqpB5M
	 PMSxDYH6sluVikDxgSRoRd+pJl5OZSWF+Ew7I37EEGZAKQhZE9Mw+Br5HLOjdDq6SMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nUfF77o3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="e/NVHpaZ";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C98E606A323
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 12:46:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C98E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nUfF77o3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e/NVHpaZ
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9wVZt1089291
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 12:46:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Sm2zRheHuhx9Zfz6c0YchR
	95H9wicGcjsIbHYljiQzg=; b=nUfF77o3/iOd6MsuLJdqvO4ApQD0hF1NDWYmjB
	15agaB6YpomQwUipoNyMhXUP34ctRob3dJ7168tFq9KK67E9XEKprTQH3wBnaVgu
	d5m9Z+xo7k3HTkb3l+1NF/7pjVdyTukpgdIVo2Q0vzba4gBWTcZmzr6Gm+87/p3q
	rrb/W1wZzVHCSO9oFJe82szq0tKHYp0mc0QZYByljGTeiOEcL9SNo0aKnjGU2gGt
	O8OgQD/j3uEPGsOZGWx8HgBPPtsulxVNx0lbII5yqZCldOoijs45eCLlA6kiBKVG
	7CBcKw3c0opUsaY8QJE3hDEQO1rxpDB0eZomcoKD6yMBavXQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhm8rqsy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 12:46:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94607500fb0so339573385a.2
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 04:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794660374; x=1795265174; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Sm2zRheHuhx9Zfz6c0YchR95H9wicGcjsIbHYljiQzg=;
        b=e/NVHpaZNMqalYTrcDKHk/2vjx7t2zTQWFjYqRoTwDkh+HFfgjhBYRFPIUfhPtgxOq
         4sIWxCdWvlcdGYIxQk3p7mYXVFKH2oAbEYfJuCoWy9RcGEkmJL6S85/l14zvIe1xZ1uJ
         iWHU0D2kwgMVYqTwKnWCgCkT80ZOGkNz0Q55TrwBgKQbxrgWLdJu8vIpAJNLKp4wwCZl
         CpxGD7fGECsGEvBeoVqkpjk3Dtpn4RVMY0sQhIuYwhP08eT5P2PpVTE8yzDSQv6lGxiA
         BTOPlx/LJvLTqRlnym5oIYiQtOjf/IKoiRR0FC03g/makLLcU6o7tVlOVVvS/FacF1Ch
         DVZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794660374; x=1795265174;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Sm2zRheHuhx9Zfz6c0YchR95H9wicGcjsIbHYljiQzg=;
        b=RrzrOP+dPUYYiNgLtcOlmiuAs6eoFBBAKP/8BagXjzlpBICm8WHuBe3AwQ95/kDNCi
         aPxT8IyvpnPuHthfFxmIQ+DF+oD2f/Sh/8FvshM+1jdxWu9XFo2cdEBnmLA0pifjXNHz
         nfXslqfARCWipFSQ6cjheHpds/+jRT+gir5cpVyQdXOv20rSkDItXNKNmKerpjy/CSEJ
         VxrmTl7/Bt7mlUG0P/qHbs/mNF2qj1oiErnzC9SUtgQYtnrFkhq6gPpY1moRp/8jVDV0
         a3h2VLLQjCVBqcGadf0OPM8LKiv09jXUuui89vCuqyZR7bzKfh0MPDdtbzPZBLkldRWP
         1Iig==
X-Forwarded-Encrypted: i=1; AL+hErHwrKBBB60nUXDhQfjMa5BEmuWaX4Nst162S6KqbEUNoR6R17ExvNz/Lf5E1VHcdXhedvtzwY8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/c1If931he0cY7Pvd+IE/xnw1dWpYparoKsCMC2/41N1w7jh0g
	noYWYmYuHp8A5GpYLa3eC9jKJM+7bXQwPOiZX6pznVVtI39YntPue/wNAuBm+QK5vN+SoBKBlqq
	LAcyHHMrv6qHSoto+aHbAd9+PhEHlpfj5iSSV7ukQjs3vR4gyGW6L6Z/bB4Y=
X-Gm-Gg: AYBFou1OCJ6atrm9590/0olVik2tVLvW7p+PS9bZCk/LeEBgi2JcF05jeVdXyCW+yhN
	eapkorIIYXOcNg36VCeouui2tB/grQz7QS5ebjNgfDCgmfa1oYchmzqZ7Fisft6zyPPOZ7yWFls
	EaZB5QQkTESPKRCBtG0YxWPF4oOgfcxZ16Y+wt09sdHduTjz560u4vwu1Hq+NEdGkcNP3ifogak
	ypecx1ByOgO6GFUCVa5scjgCkfJilidTO6NGizn+h/muk680qAm2J0QEjoGSPIojILd4c0Pmg97
	rEgCJQbu48gkHfLum7nL67WkF+dOh8WkI93z/9GMhi058LXoX0eTmQyh+WFXFWly8eIY2X/HFRB
	Qrsp72mufHmbHAZvfxV9L0G+NhP2Z5trvZv2svS5oVWMYhREKegJTPQKLnhNtlVkbvpeqr3kkf/
	3jj9dNrCrUQdba
X-Received: by 2002:a05:620a:701b:b0:949:3ba5:15d1 with SMTP id af79cd13be357-9494ba607f9mr836093685a.4.1794660374085;
        Sat, 14 Nov 2026 04:46:14 -0800 (PST)
X-Received: by 2002:a05:620a:701b:b0:949:3ba5:15d1 with SMTP id af79cd13be357-9494ba607f9mr836091585a.4.1794660373584;
        Sat, 14 Nov 2026 04:46:13 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c50a6c826bcsm153977266b.11.2026.11.14.04.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 04:46:12 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 13:46:11 +0100
Subject: [PATCH net v2] net: qrtr: ns: keep notifying local servers after a
 failed send
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
Message-Id: <20261114-upstream-qrtr-hello-gate-fix_b4-v2-1-2fb62c2853bb@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/41OWwqDMBC8StnvriRBbO1X71GkxLhqihrNRmkR7
 95oL9CfgXkwMysweUsMt9MKnhbL1g2RqPMJTKuHhtBWkYMSKpNC5jiPHDzpHicfPLbUdQ4bHQh
 r+36WKRpFV6PqtM5FBrFl9BSdY+EBAwUofiLP5YtM2Lv3WGs5OP85fizyCP89uUgUWFapEpqMv
 Mjy7piTadadcX2fRIBi27YviTSiV+wAAAA=
X-Change-ID: 20261019-upstream-qrtr-hello-gate-fix_b4-c2e8c2f4f906
To: Manivannan Sadhasivam <mani@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chris Lew <christopher.lew@oss.qualcomm.com>,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=ItKL47/g c=1 sm=1 tr=0 ts=6af85816 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Pio92nEW-iWscqj-QAQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA1MCBTYWx0ZWRfXz/jL0I7tKCWF
 XA1psRJ+YAG9GC9aJuDuj7fTwZ1D+LfnY+dRJhXNDF9pLIlKDnrs6EZ9thdOb55P8vSU0r1tZk4
 H5y24ub8ejet/fU6CulFuk5k72vJC1g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA1MCBTYWx0ZWRfX/QYihHUNcYBA
 L5szojVoFzEYw91TBmDi7z6zsYJdI25J6LwdvVSuJM0lMGFXfG4oiFj66jmlEdx2IHjN53QREC6
 8xGpewl5kH7yGSbVZSJsod+6BZRh4Abcsl5gV5TcE4B2KiD4hFfzdblJxuH6uzprnlvOaXFyPPX
 B+gC/NmB42xKh/f8BkUCZUcqMdBsKo3vw+b4tYXvnb7C+qCJ20EhnbO3K08dQ6siqN8iiIqeEo2
 XLRS8ME2x2PAH61uFyv8lc6x/521X2uoQVEzHDBgEhe85Knjvj9UTKwteOD+F1Qx9SmP+9IYca0
 HEB127hmHIZumlT6FqgiP28LUPNFnBJrwEGyIjw1ZemUPBxrmTV4OYir3PZ121kwe5K5lfjoPD7
 5W1MCsRwknpgtzFk7aPwUXmwqlu92VUgsMLD1EvTSAa9bXUR+UlVDyRUaKLjdpq9CDhv54p5nbd
 rnPOB15Bq3MQvzGCuKQ==
X-Proofpoint-ORIG-GUID: 5jOebTXzcrH4qodfVtn5bMuvl1AQglqq
X-Proofpoint-GUID: 5jOebTXzcrH4qodfVtn5bMuvl1AQglqq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611140050

ctrl_cmd_bye() and ctrl_cmd_del_client() forward the event to every
local server, but stop at the first failed send. Each send goes to a
different socket, so a single server with a full receive queue
(-ENOSPC) hides the event from all servers after it.

Log the failure and carry on. Likewise, keep notifying local lookups
when the NEW_SERVER broadcast fails, which can only happen on -ENOMEM.

Fixes: 0c2204a4ad71 ("net: qrtr: Migrate nameservice to kernel from userspace")
Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
The lost-announcement problem v1 went after is fixed by commit
743b5c86276b ("net: qrtr: announce local services again once our HELLO
is sent"), so v1's patch 2 (holding control packets behind the HELLO) is
dropped, as Mani suggested. This is v1's patch 1, reworked after the
Sashiko review: it no longer touches announce_servers() (every
announcement there goes to the same node), and instead fixes the BYE and
DEL_CLIENT loops, which stop at the first local server that cannot take
the packet.

qrtr_bcast_enqueue() still ignores the per-node enqueue results and stops
at a failed pskb_copy() (Sashiko, pre-existing); not touched here.

Tested on the Arduino UNO Q (QRB2210) with next-20261112 plus the board
support it needs, with a test program that publishes a server whose
receive queue is full, and then a second one, on a higher port:
- unpatched: the second server gets neither the DEL_CLIENT of a closed
  client nor the BYE of the stopped modem ("failed to send del client
  cmd" / "failed to send bye cmd", -ENOSPC);
- patched: it gets both, and the name server logs the failed sends with
  their destination; modem stop/start, 3 boots and the board tests
  (WiFi through the modem, ADSP, Bluetooth) pass.
Built with W=1; checkpatch clean.

Changes in v2:
- Rebased on top of 743b5c86276b; v1's patch 2 dropped (Mani).
- announce_servers() left as is: carrying on there only repeated the
  same failure and could print up to 256 lines per HELLO (Sashiko).
- ctrl_cmd_bye() and ctrl_cmd_del_client() keep going after a failed
  send, rate-limited log with destination and error (Sashiko).
- Commit message: lookups are local observers only; the NEW_SERVER
  broadcast fails only before enqueue, in practice -ENOMEM (Sashiko).
- Fixes: points at the commit that added these loops; for net.
- Link to v1: https://lore.kernel.org/r/20261019-upstream-qrtr-hello-gate-fix_b4-v1-0-bd420aec171b@oss.qualcomm.com
---
 net/qrtr/ns.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/net/qrtr/ns.c b/net/qrtr/ns.c
index bcb090ee79d4..8209573221a5 100644
--- a/net/qrtr/ns.c
+++ b/net/qrtr/ns.c
@@ -374,11 +374,11 @@ static int ctrl_cmd_bye(struct sockaddr_qrtr *from)
 		msg.msg_name = (struct sockaddr *)&sq;
 		msg.msg_namelen = sizeof(sq);
 
+		/* A server that cannot take it must not hide it from the rest */
 		ret = kernel_sendmsg(qrtr_ns.sock, &msg, &iv, 1, sizeof(pkt));
-		if (ret < 0 && ret != -ENODEV) {
-			pr_err("failed to send bye cmd\n");
-			goto delete_node;
-		}
+		if (ret < 0 && ret != -ENODEV)
+			pr_err_ratelimited("failed to send bye cmd to %u:%u: %d\n",
+					   srv->node, srv->port, ret);
 	}
 
 	/* Ignore -ENODEV */
@@ -458,11 +458,11 @@ static int ctrl_cmd_del_client(struct sockaddr_qrtr *from,
 		msg.msg_name = (struct sockaddr *)&sq;
 		msg.msg_namelen = sizeof(sq);
 
+		/* A server that cannot take it must not hide it from the rest */
 		ret = kernel_sendmsg(qrtr_ns.sock, &msg, &iv, 1, sizeof(pkt));
-		if (ret < 0 && ret != -ENODEV) {
-			pr_err("failed to send del client cmd\n");
-			return ret;
-		}
+		if (ret < 0 && ret != -ENODEV)
+			pr_err_ratelimited("failed to send del client cmd to %u:%u: %d\n",
+					   srv->node, srv->port, ret);
 	}
 	return 0;
 }
@@ -487,11 +487,10 @@ static int ctrl_cmd_new_server(struct sockaddr_qrtr *from,
 		return -EINVAL;
 
 	if (srv->node == qrtr_ns.local_node) {
+		/* The lookups below still need to hear about the server */
 		ret = service_announce_new(&qrtr_ns.bcast_sq, srv);
-		if (ret < 0) {
+		if (ret < 0)
 			pr_err("failed to announce new service\n");
-			return ret;
-		}
 	}
 
 	/* Notify any potential lookups about the new server */

---
base-commit: aa40afa831ebfe45e40a23721711059f2ac584d4
change-id: 20261019-upstream-qrtr-hello-gate-fix_b4-c2e8c2f4f906

Best regards,
-- 
Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>

