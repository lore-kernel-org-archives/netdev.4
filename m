Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795171477;
	b=ur4Rp773CHBJthhMGxbRmeVJvjUP94VpYWbM6fHAx1zez117Xv0EOannK3V18Xg4LXaq
	 3lwempvFBdYGvlu2X/gY5E2lpMuixHZg1r5b3tNdX18K5YV4ck+ykQbW2LcSRBOsm4keu
	 Ai4WKQHV3k0ulEA0drtJCVylsJx/4F83bgoJF0dC0OI4husaeqOfrnfequJhD01LVUCI8
	 CizkAXFhHYehIOlQmgkTDLBUbgE4YM8Qm0lzng34OxWXZE6jz+KU4hkVAfp8NGCfB+Z50
	 NUgl5QxZvyUFimwE1q6pyLaMmAesip0CR6MTUfH6XBM2dyF8/AKL7rZ9FTHJjEbk5Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171477;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CFNJfb0rms2y88yh6JoAtHT/4DKUKg5BrlVVksMmBdA=;
	b=cAIFuYGXn6Z1zY7F1b/u0AWJ20yxZe7NHwr42PwlsHyOpktefHyMERFCjDGASQGEZDj9
	 h3vHnDltr4QtbyDTkTAzubvTVD4XgGOMOc2z3L3GmPICGS68w4flAnWNwCzJM3nDRrqom
	 BTLUVrXNFz5PlD2e0Qcq+AAtLL1tlXULiywq0mS2p5CmE9o9Rau7PCsAmzyYqylTgA4gB
	 PxjGjJBRubU35s5BifPWhtotFoS8yzwnttUrfsKwZT6M127sqKumcJT58Q9CBP9Eis9Gs
	 bKHisRdtd5SxLU4eNrf5hZqO9lbwT0eiQPm0Xl3FXzTurdZnJwciwXD9PcZgLPMIxGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BpLfO9iz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="f7/7KSgQ";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19F3606A33E
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 10:44:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C19F3606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BpLfO9iz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f7/7KSgQ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7f1Dh606035
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 10:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CFNJfb0rms2y88yh6JoAtH
	T/4DKUKg5BrlVVksMmBdA=; b=BpLfO9izJdyIyPqhsPAUWIK0SMQQAiM6dFNDVU
	NqapiWQDW3feJH7UmC9fe467YOHGgwWqLYn+3iQsYBeiXCXhQYbSfARDuZvp1Aag
	PQ+Ef7AQDNASE9n0ld5uSBMSthVgCPpmChNXogYKy2rbxwWXizlGQxOWoYgHMkJI
	VHXf5VDGrzuoud3HFWNGZv1WfH+kFMCeUbEpkHmG2OLtK4Szr1L6TJsdKj/tpSBB
	INB3oQXjYtpcZV8/brKZpYYbVaREKC9pM0ME6/xXOJNWkoF/DHtKmGwn4ZtYyA6y
	Gj2n+IMOVruoA2JmSzs7Oe+DvwzhC6kQhZBXqSFeAihfhJJA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqs4pn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 10:44:35 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3821eb27024so1252086eec.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 02:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795171475; x=1795776275; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CFNJfb0rms2y88yh6JoAtHT/4DKUKg5BrlVVksMmBdA=;
        b=f7/7KSgQE/WBCZ2U7ES/+F090NTi5Vj/H8DAj9IBdfL2bsWGFjAfpK56Gp5bG67QMP
         dQaOSME1KirGzzAeRxPpBT8c6Tk7aqkwwL/I4XpiJNrRri0lgp/58zMbiZny7mxBpmcA
         UG4EUlCPLneaAcu9yyZhT8JvuWGTcQ47PkfbsmCWtbEiGx4mYSnnwrCXnlGemxIr/QU5
         xDNmXfsxE8OapfZfFrHJqOZQg2xavB32F0GRisIfNyjGya3lrojb7dVkVvgfeAKMj4Qm
         V2UJ/RnuZLN18p5EwAm12lpMHd+B+F52ip/fycta3WEJ36nO0Yk2I0D9zxYPEyZmQefi
         /yEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171475; x=1795776275;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CFNJfb0rms2y88yh6JoAtHT/4DKUKg5BrlVVksMmBdA=;
        b=lqu7irBqgq+1ojc7+La6rjGdgFHF+8JdN1UsDTPvrPI0IX6Ggj/H/qBPoK3SKyDRCd
         IbGpiPLhDtQBpha0Rpj8raFwHruTLcT08GnWSMu7p0V/oAJyQb7uQiQ06DDGs5JBxbut
         gYiAcEAkJ3iDj4H9Qovu1KvGGi7N17oXa+/D3gL79HCGceAzIpV3puhXGrKOdU9conTq
         BBo8fNgLqDp0om9nKa9elgVIE4IC9OtRBIbdmf1Tbzzan2SY08GymLQwwrXVngYKoBRS
         B6L7J+BK9/LwWZhpOTD01ShC43yo8WR3zDoIGMxPb2YjDZpDe0J4j//Z8mhnWKowDiHO
         1aBA==
X-Forwarded-Encrypted: i=1; AL+hErFH7CgP21+6lPgV9BjWclNO1YLYRlsHXjJJrYir/PKdpDo9eLUKckR+MofU8JFhdq4Yhi5mXB8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RPrtq+48751F+j1U5bJ6ccRx0Uy/hY3OJ+ljFDhWJN5Xpb1Qj
	LvZ+/DWxnZcNFif4pyeDLnqTsnqsgUQpLmIlGArWR2H7oBMkP1oC7d1C31xMLbdtz/Nq76e/fEC
	M7dNHw7F/2JeM0B2mFFusKQka1FrOefss3dU2CSiVEb+2Wblf9lH1phqhXSk=
X-Gm-Gg: AZFdTZd5g3Vwsz/ZaFv4rHFkrnaP2vdc+ZelRTNkUK+ZqhHQJo6Vnd+dybHs5u+Rl+k
	VnylX5Xwi+MCCdbUYV9Ugui8AHEy7nmvmmgw6LMYCXWdjswFrWgDOp4EvW9LIzpFVLoP0Y9FjfU
	bk+KkkYghArfZqB93HB1aDEupk9HysOhXsUEVMIJfL+qcAOSolyO/2xE1iidEZgegc+9gmdEsIM
	+4yor/fCSVPdN5KQyC9OOeoqP2aZyKFkEDHZBYqaEDlD0WWi3CcCGhDqhhfCfqxDf3ZK1zoq+Qf
	cgg2zAz1LeGjK1QZR2a+OJMyLK2SRyhw9+INfh8ECh9YlDl9hiXJDXfjUH6xkLOHFDN5H8VfVjK
	O7McTzSmAe9SzaPZ/8zV7ZrwAu6I7LoDTAcVMh684bPJIcF5sr/bpOSfMg3toNGf9TBwn2wqB
X-Received: by 2002:a05:7301:182b:b0:383:b90a:3535 with SMTP id 5a478bee46e88-38570c2ff43mr2119397eec.24.1795171475202;
        Fri, 20 Nov 2026 02:44:35 -0800 (PST)
X-Received: by 2002:a05:7301:182b:b0:383:b90a:3535 with SMTP id 5a478bee46e88-38570c2ff43mr2119366eec.24.1795171474618;
        Fri, 20 Nov 2026 02:44:34 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385d2b93dd9sm6097471eec.24.2026.11.20.02.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:44:34 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v3 0/2] clk: qcom: Add I2C and TSC clock support for Nord
Date: Fri, 20 Nov 2026 16:14:19 +0530
Message-Id: <20261120-gcc_i2c_tsc_support-v3-0-e631872e670b@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAIMkAGsC/33NwQqDMAyA4VeRnldpUqe4095jDKltp4VpXaOyI
 b77qqcdZJfAH8iXhZENzhK7JAsLdnbkfB9DnhKmW9U3ljsTm6HAHEAUvNG6cqirkXRF0zD4MPI
 8U0qe0cgaDIuXQ7AP997V2z1262j04bM/mWHb/vdm4IJnUhqBZYGmsFdPlL4m9dS+69I42MbO+
 ENBeUxhpIyuS1CiFgLkAbWu6xdRSclWCAEAAA==
X-Change-ID: 20261107-gcc_i2c_tsc_support-64aa352d3b1d
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MiBTYWx0ZWRfX07MHx4SJ+GAL
 aeDiC0wtYsrCH0GGpQqn1FKKP39fRbivaklMwATFXxUUpvTcnS5Wfci4q1b6wi81lDGgdqPVijU
 KIIg0dx7uPOGtCJEQyRnzvQCAkvYqaldXhh2hGKN9/oWkMebM1uSwDkS9R2lMrPYCGAh+hz1azN
 t/c6Rd65kbVAPHA4jl1Eivrqf5YE7FPuQ8fWx7ceIZ7vdLsvU0oc+SNBsm1Pp70+4pq72aTcqsg
 HUDoEzq8Z6Vw7lPKOa5Q7dmVl6MR/sGhQLKXLek7bIhJUywXft2shP8mWfPgQhq/D97DgKW5puF
 HbMTh3hlRi5EFfivySxVHYbfpESeGHL1nRNYpid4S6Dw45/w4xB88ulm3+I4E6jfpqu1xtwr8fl
 QS1wQf9Ys5xDl67MBLacVZDVMwPA0CY5bdQRTRqTFYTAPMHLGixch1i5NIZH0cyHXeuY/Mm0kgw
 hYa2u9T8r0EZ1zkWH0g==
X-Proofpoint-GUID: gqdfmbsDQc_Dcln-SBvHLEGri0Nyi0px
X-Proofpoint-ORIG-GUID: gqdfmbsDQc_Dcln-SBvHLEGri0Nyi0px
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MiBTYWx0ZWRfX0NHt+lhdCHst
 e97o4oKWCRIgX9H/1hWRKAxmaYSrD5VCv0DWRchz3FcJ8iQot7TbTd8mWeKaTe3ALHD83aATfZZ
 /CTsWiPSI4trOpH5CdM7v44QiIus+js=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b002493 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DIp336sofITyGauNNAMA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200042

The Nord SE GCC provides clocks and reset controls for its I2C slave and
TSC subsystem. The clock IDs for those resources are not currently
exported, preventing device-tree consumers from referencing them.

Add the binding IDs, then describe the I2C slave and TSC clocks, resets,
and TSC parent PLL in the Nord SE GCC driver.

Changes in v3:
- Collect review tags; no functional changes. Picked up the Reviewed-by
  from Abel Vesa and Jagadeesh Kona on the driver patch, and the Acked-by
  from Krzysztof Kozlowski on the dt-bindings patch.
- Link to v2: https://lore.kernel.org/r/20261119-gcc_i2c_tsc_support-v2-0-dcb91a0b0013@oss.qualcomm.com

Changes in v2:
- Drop the se_gcc_cnoc_i2c_slave_clk_src and se_gcc_i2c_slave_xo_clk_src
  RCGs; the se_gcc_i2c_slave_ahb_clk and se_gcc_i2c_slave_xo_clk branches
  are now leaf clocks with no RCG parent.
- Drop the corresponding SE_GCC_CNOC_I2C_SLAVE_CLK_SRC and
  SE_GCC_I2C_SLAVE_XO_CLK_SRC binding IDs and renumber the remaining IDs.
- Link to v1: https://lore.kernel.org/r/20261107-gcc_i2c_tsc_support-v1-0-433d02972d7e@oss.qualcomm.com

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (2):
      dt-bindings: clock: qcom: Add I2C and TSC clocks for Nord
      clk: qcom: segcc-nord: Add I2C and TSC clock support

 drivers/clk/qcom/segcc-nord.c               | 135 ++++++++++++++++++++++++++++
 include/dt-bindings/clock/qcom,nord-segcc.h |   9 ++
 2 files changed, 144 insertions(+)
---
base-commit: e8017d29067fd1310a65c3494ce1a1b492adbac6
change-id: 20261107-gcc_i2c_tsc_support-64aa352d3b1d

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

