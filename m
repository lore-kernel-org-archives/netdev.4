Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794953838;
	b=nZXpPtSsmIQGwVYhnOVGX6fgXh/T9ylfRRuNN4fqfN6Pw/gnUOdz4vCgiWkUKr5QqjhC
	 WU2hzjQQs3mvaiMi/6RcA73OPsj06h3YCEEDLuQ5w+IR0xVmq9kx7rU2f0TEgDZKqD3Gz
	 eg6tiB/bzguAECcXRYwmjKxPJ+J86ujcMwy/VdkJqoWIUxr0QudcCbIvlcIYr7MwmOV8Q
	 yJZyKj4FTVu+w32q1d6ZEw1mb+FtimyLba/anSrkf8OnEbmOsY3brUBMksFWDKtNhb21o
	 4MycaWSnOOduyr/gGZ/ZjJ6nN3vR9zNEYxf96cVlYaC84FnHy+Ql+whKmL1mL3QKiRQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794953838;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version;
	bh=naIMYO16Tb2J0b8QTmQ8uSWyAJ0zbIqQUrNZeGUwwtw=;
	b=paQK38THRvFuBQR0Gv0KgvuxF3tQqqOZlCPlPiTH0Fe+GK45ohQK5IslAXA0GyeNhs1K
	 pXAh8IA26b/ZY4hYmMs0s5b5q2ziumjgs6ASCzXFyX20oj4/6I50Oa1+QJ7xQV/+9Vbs7
	 /c+R74FwCRfNDee5kTyhwzGOaHN0tVQaunteBZCJ9J3Ch0Nu2LVVwN0bQEYuHP/ba4Iw5
	 yNyYWQIGaPBJsp0O9+oONrutyMpSBJY75tBby69UAIekJNMmop8MF6Ww3SYkTnp1v9Q+H
	 pwCg7UFSyokESrdGDFkrK5S0xRpnYS45ZjA1Wo6IAFAfw7LiaVYD/OsnoDnmMjfrlCQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=EvkMrAlm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467B3606A339
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 22:17:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 467B3606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=EvkMrAlm
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHM25Yh1933615
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 14:17:17 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=naIMYO16Tb2
	J0b8QTmQ8uSWyAJ0zbIqQUrNZeGUwwtw=; b=EvkMrAlmrDK8ub69Xg7pAjpcfhg
	bZmfLUAoEXVsHI582DX2XvH/l6wGABdG9omOSqhVscA/IEoGuPA0CuKpLQIwkQrd
	hBEyFCYOGEXtjyA8x3b0g3YTHTx/sHwE+cQmDTvaKvteMtyAtX6dmBfQkCozkLZf
	p22cxMmQsz7yD32uSvOi3HsnxIikFWp62dCypEtCz6SeWEqW8jjr10TkF5/Z4PeJ
	/8L+8tNnAtQ73AhwuAwiHeC+vacHLSuhs6/KyihzjSuZu88a3UB0O+P7RJ2pM+Pq
	VMyvbB/nLDYMAxlh+5ivYxFI1VuB1MRuJ0Byb/cV3VEMNBGlBCxo+Gavfxw==
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j0mn0xqaj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 14:17:17 -0800 (PST)
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4925ef75fc4so172063f8f.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 14:17:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794953836; cv=none;
        d=google.com; s=arc-20260327;
        b=XOBzdeEfciNRLtPi3RfLJo+llkEhvE1loRyFYp/j+brZYSMN5aPtFP5D4RchfK4tPX
         U34lfN/wnMSkEuOFPsG0Vi/Gpv6S1dQnE3Mv8DhIgbePJybQztkAO8HKy83uV/6Hvg1v
         LgAl68fUfsVqnf1GG56JVuppL5zykP+NPWKn7TAaC2EcIYngSZw0Oe0P1SGmzKjGaBI7
         KSAYdQZFKuQg81Ul5/9bdxjJLH3FpX0vT1KC/00leHexb9M7kRb48VWqcAwK8QuqjB4+
         mrg8Rq0ppDkQAu9R/QxyxA+XuiEwXiF/F6jvxDkKgspKPgB37f/VRgMbMLM4x+ktZKss
         Ay/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=naIMYO16Tb2J0b8QTmQ8uSWyAJ0zbIqQUrNZeGUwwtw=;
        fh=qod244yoB3Swx6BT8pwI4iCjWBm8w97P4EwtSYE3820=;
        b=Z0rkG3+29GcjvP+STh8FiMLefUXFNnvAPyQtoYYZeYsuRmhP2dq7iO5fiLRVUnSAU1
         vJld6IX42a/4q/PbvJsVmbYBiOidrBHX/Yl90Bmp7Ena/nTKrLzjMQejUxytFAesgVdL
         vr1y/PcyQ1pb0DcdxsojXdBNdZcEqeNExVu9Lppd/zLw23ADwspWM+Xxj8GLS9mr4+n3
         wYZpa6eIgXhQK4eeUEoH9w2jS0OyhMn+07xkPSNtK4qFsOsU6vTgoVB9PPiMQe1p3ns0
         AJDiMBNj16P+xxhI4QxBfSPrAdUUqJZ3tUF8tB4GZ8oGuDVzjhLC43SXdj+J5XdJXNFU
         N1lA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794953836; x=1795558636;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=naIMYO16Tb2J0b8QTmQ8uSWyAJ0zbIqQUrNZeGUwwtw=;
        b=PS0hmVIUEEyG7T7ISa4WrTsSC/zLCaUH4+ozlbJjn/JmBAimUN1aXxW+JbtUPxTQ39
         x2jXRjEnRuK8sRv+YeQT5/eiG70Q1nq8xk9CR0K0ewui1oL16LQ1AFqFKbKyfeicxfTp
         upakpiOhLQh07zMsL3mdJijGZX91Yt5h9r65GDMBhQx6AO561a2Qhu6/RojORR/kb+Hl
         ewvA1RAsnVHl9RpaERfzWy8KOO7LsF8sCaaLW0BjfyRht7ua2+gv368TGxP5raKHi1lD
         O2X6b9i0ucRXugc6cFXMa8vY0zS5Rp+t024vJM5WIUW4lj0VzHAsmCFfEkHP6BhrDBwJ
         MQ7Q==
X-Gm-Message-State: APuU4Z+nStRK+Dc+qjvWUd/dCWGNHTCqfiOl3EU03GJXdSLcd6IDgvis
	N9YXZrURyJCmgAN0ANhiQYUZIqTroMDOh9IET7zyJcLGBPf5OWbfFoSfoFpa5BR+hEShrshCI4U
	EYnX7uySU+psRmvxsvt4xc4eseeWNC1yVIDvGo34hx9nHaBThyE47SJZ8y5U3oab3QWLfyt6We/
	PGdLYQmTpQihrr66Ar8jVvWqa1h1IAm00=
X-Gm-Gg: AZFdTZdyOMsYsq9p68N0cSVGg3CqYAgHomhG3LFfdAH5PJ2MX3Xqv8yUcD0Cm1euGwh
	aDPV3prrlWOJtYbRro+YE52gD1JBH3ri7fJ2IeO0meZu6G8CepNDLaZInF/i0/tzb3tL058xs9Z
	wF8CnFrVDwWWvv+IvrFIioYPlm5DhC6pjT/PbTsfywX/jSaPhOxMBe0jNh+ZkYaXGBdVpKUOHBO
	rzVHB+B7GuUifj48AvIl+tXSaCiiUFAJwO7zq+Tqeuh5Yzr9n8=
X-Received: by 2002:a05:6000:603:b0:48e:5eac:7e48 with SMTP id ffacd0b85a97d-4a63d2cf7f1mr1645585f8f.22.1794953835999;
        Tue, 17 Nov 2026 14:17:15 -0800 (PST)
X-Received: by 2002:a05:6000:603:b0:48e:5eac:7e48 with SMTP id
 ffacd0b85a97d-4a63d2cf7f1mr1645531f8f.22.1794953835465; Tue, 17 Nov 2026
 14:17:15 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111005533.6436-3-toddfreed@meta.com> <179471269307.2199510.1215468778950936295@kernel.org>
In-Reply-To: <179471269307.2199510.1215468778950936295@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Tue, 17 Nov 2026 14:17:02 -0800
X-Gm-Features: Aa3M54r5Hu3045uljd3xO655IC2ADA2xeFtOm9g-Da5bBZKD676NvfeHASL2RN4
Message-ID: <CADh2yMznmWWJsh4ArEhrm2n9fG8i7o3u-kjLrvs_dwsBPiFvtw@mail.gmail.com>
Subject: Re: [PATCH net-next v1 02/15] psp: take the psp nexthdr from the
 packet on encap
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, andrew+netdev@lunn.ch,
        bjorn@kernel.org, bpf@vger.kernel.org, daniel@iogearbox.net,
        daniel.zahka@gmail.com, donald.hunter@gmail.com, edumazet@kernel.org,
        kuba@kernel.org, jhs@mojatatu.com, jiri@resnulli.us,
        john.fastabend@gmail.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-rdma@vger.kernel.org, martin.lau@linux.dev, pabeni@redhat.com,
        saeedm@nvidia.com, horms@kernel.org, tariqt@nvidia.com,
        weiwan@google.com, willemdebruijn.kernel@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA4OCBTYWx0ZWRfX8TJqvliomfHF
 6kwOp6QKCNEV3GO7javzJKeZMrFGdOV+Q/ZO2QEjWSwdj+SfVcS6Kgxx2LXsIHNIM+z49QbbIS+
 qIJaS3TDDZ9g+3PwmAD7lroCYti2/VXtHoU28cnu1algmWBOMVIr8GwBmMacduS9cV1lGIyj7hF
 2TdSyN/nwCPzSg38UbOG6Cz2in26a8EMkC3r83RAnG+H2N6WWRjYxSzmz3BwGQWRufLVMMmHouK
 6xe4LmaeUdO8762giPiXFTiZSFpdqOtNFEpQ3crdvktAHWDUOHgQIPkRcvOWaUkbynQmC7PeHxJ
 7T0OZkPaeazPAF1nyFPgH733Mw/THUumMwrlp5/AlJ8Vru94HgkoATfTnv8GZQnIgujxoLMqZvS
 /K2kSxTJD24th7QojL10S4V22zyXhFKnyy03cvVozKOvGM/U3wgfzTvBiq0NzcWTIHPtJW6Gw4F
 CQh3zGJqRgGzHRzZ9QA==
X-Proofpoint-ORIG-GUID: xljbCr207tRkSbduJFIUaPvaivXrih0g
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA4OCBTYWx0ZWRfX2g2M6OtCeuEZ
 +y+AwDjSM90yuwgEp0RKyosdXZF0AXlWlPBQBr0Y2mgKa5FC3+SCnAzb8rQDzK618vVNE7rAqDP
 X8FqSUfhiqJ3Mc6ZkUoGOgUCjSm4qw4=
X-Authority-Analysis: v=2.4 cv=HcmB3SE8 c=1 sm=1 tr=0 ts=6afcd26d cx=c_pps
 a=pX1sPZUoWPGeQgUnKQNIgA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=xtH7KyWI9dI7BmFOsl-x:22
 a=-eSvoOO0VIkvbIxHXOgA:9 a=QEXdDO2ut3YA:10 a=XGGHjNwGSpTZ5T66x7Ix:22
X-Proofpoint-GUID: xljbCr207tRkSbduJFIUaPvaivXrih0g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_04,2026-11-16_01,2025-10-01_01

> [Severity: Medium]
>
> psp_dev_encapsulate() now accepts non-TCP packets. Is the outer UDP
> source port selection in psp_write_headers() still correct when skb->sk
> is a UDP socket?
>
> ...
>
> Should the sk->sk_hash path be limited to TCP sockets, with other sockets
> falling back to udp_flow_src_port()?

Yep. v2 will only use sk_hash for TCP.

pw-bot: cr

-Todd
