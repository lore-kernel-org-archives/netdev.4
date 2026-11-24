Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557817;
	b=xaKszDCD0vxsN5fEfdIssa+eWFsu/7nC9wC49wlyr9f89iAyCpq1VNZ2quX003q0y7Nr
	 2nw18VGAJEDRu9I6K1Hqj/YFJrGAhC7gCXdL9Ssrgbh2jGfPE3pQfAICXvUKy/+gDyFya
	 Y4updkMJnTYBEVmYrrjsiUAsh+SwR8FXCsdFos8CbMI/5R8znWzXhhaA5sJQ7uFubDCT3
	 BW/tJdLPIaTfOwcKaOJDoemXpOWoCfpiUBj5Ma4liKfU02Ca7IsDW33f2THIStNSsfmOo
	 IpW+T9T6gHA8C3MJJhh8aE/e6iivfVyk6abKZwfH3DPibtYjFyQJlnztyGdeWaCSjhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557817;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=KlFzMLz14WgpPVwdqGiJVEqdnpE7naQqAvTjh6Xp/Ec=;
	b=QcDgZLs5VsYRU7vXoy3j6M8cCNWWzIPwYlu9vID2rQclMxSxytmDJNLwujvXiA0nydIr
	 TANNVtxkFHjPBC/Z9FBO3Jr1ExjJO3QLcfHNMdQEJY3oLJV6Q+VDjxan+5gIVAwUxEa+7
	 /P9LQp2BdfuQrHudpm48PARjlJqedIti4gBFJ+UD3ga9nLSdGWFbGzf0MQUSDL0fYPmGi
	 QQqDbyf6yaV6d/W63Y1ZXPZ+V36A8Mp4lDVa1elfZT0BGMI39+jat+pDxSi7oR3OX2sej
	 u4LHreUUQURs7HtvRXreAfWJG5Gzmrfc23YmitpJPO5Bdd+avZSeA6gGwP2tSi7NnoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UzCx1RMk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C1yr9aWZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0A1606A326
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 22:03:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C0A1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UzCx1RMk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C1yr9aWZ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOIXSYq119675
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 22:03:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KlFzMLz14WgpPVwdqGiJVEqdnpE7naQqAvTjh6Xp/Ec=; b=UzCx1RMkov5Kem7U
	3BzzQH68AKZijy5TeHM45Zd/N6KcX9LUEKYzYubhOhv5wO5L8EYA8VhXVZAy9bRK
	U7S429y+LtcbwtmMALeRdB6zov3FZU44zqKWkoZe/zrpB7s+nR8EtVNZi3B/mzHD
	VucNGJrx9nKSiBBmC5hYB9vj2+MPO8aJuCe1bZFfjrUQkXbzIPTX231AZZnrMii1
	d6MvIfU7vo3FWCYnLSGc7PEyuxe4YDynr1Mfe4vK5joclgfEGFzKEzGQZJy7mlUn
	ffTLXufMfLbOCXV6/T87PIKBe/SfI47+EA+Z/xj+JP8JjuuEuRt74Ry24EAOmEgJ
	Dc8GVw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5effs8k0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 22:03:35 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b25d977b91so5440904c88.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 14:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795557815; x=1796162615; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KlFzMLz14WgpPVwdqGiJVEqdnpE7naQqAvTjh6Xp/Ec=;
        b=C1yr9aWZ7fi2wZrTW5sAF4hxq0i7AUoDKZMygrziYiWnsD8ctUNgfIEvw7J9ZEKDEp
         1IZeg3rco6ISBM0XNqE7kTUjG0nvSr7GApQ95uYx+uDkBtN8N8GklSvokS37O4i5RDGo
         lhk9s3YT2f/F4o10LVGatMi/Xmvkux57Rb6qiV6VUQv6aHxJ/GVbdGXSZEwSu0Ss9Tbk
         TDxw7w2YYh3+Q3B4adc7pM4QCfF9NtBoFLHTSCh7NxGXEA05gBDm5gmWgzqnwVKLSIFW
         PudjgB0ogK5mfPCcD4MENmnd40gFRMsFK0+7L6VFuWi4PUd5f3NiXdZt3LJZhxmFP8It
         feIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557815; x=1796162615;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KlFzMLz14WgpPVwdqGiJVEqdnpE7naQqAvTjh6Xp/Ec=;
        b=Gylkazm+SGm/SJ8sXax+9BtZxe86KZQD0AkXdW5iz7HFgkkIZgj5QwWeCwHTn9qapS
         UNSlZ5VAYuKYUJuWKxjVt03FydoElj9MfKowVr8kw++wv2zTZCagM0fZQfMSWNj1PvcE
         Z8du8NvobYFe9kqpL6wEPejiMqc4904AnDUQHlO+yeU0qyKQMB2iq/XiVv9oxzBSgzvp
         BZJw2LT+gbxLHtTtl+PRqxrt7AXgwZ1/plGHd2LeaZTG3xR2iNFalCcqDqKqomhwFO6v
         UW7KfBP1dXrAPph036TArPmHEiujOp/eCVmZ8hK64uE/HW7RFu2gNqnNYnN7pAXJfWii
         WrHA==
X-Forwarded-Encrypted: i=1; AL+hErGtWn6pURRTq55sri+JEPmbDi0hUbddEFb3AgB1W/9Scl10PDY5eSCw4AFc6NeVlUbS3YZG8dc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CcmUtCtK8OclGQdVCniaZxaLM5I22R60GnnaZ3uHHjeTejj5T
	1wONDr4KOVrLVqkOF9pAJO8VNbUGRK2oY2hhpu+utrgJ0LEEi5r2Otc2qmeEftOWFvaJVK0Y3ZM
	qyLNZ2cKUZZCcYCOtDWcy7UGrNeSGxSZOsRK3x7mhL7EYWCabNZ3/wWhEdX7qfIhpeyk=
X-Gm-Gg: AZFdTZfRMfMGFZQkDwc5Td13dRO3XKFPLTxXb0bQcTxiB+O/R3oIRxTdwQfS/clFANr
	Sshfac3+g2uumF9CzmhyAl4l4mFN96eCI4GeRQJgnRsfpeZ/dCkAQkk31nCR1v0Tw1Ng8i8Qqza
	cLInT3BN9/+SyxkU+FvIAxPpikqgAwbTdJSniWXNmVnrb9M1r0ROdplemg9NinlFFRn4MRxnRb+
	ysCQx/GCxcW57EytfVLrxMBwaP8GA9f2XuBUNsgYiiI3IAYJfYVOpswuok9I9fbeiQRquFh2UJW
	gXoJpT26eHmc6fDQTDNMDMtQhVGRvDiFxEDeT8hiY+EyGx9cxHX5yq4vlVrETT7yHFeWnJU8AMm
	/VC054znRIgJj9+LbUCpuPQycbqdvUrVHdXOgqmniCygto3J6icyIf38afgX76YbUtK+ZPg8hJf
	qIvMSHxuDBd6WzwunZgPuP9QSX9izonUkX9Ym30w==
X-Received: by 2002:a05:7022:b056:20b0:160:a80f:3ed2 with SMTP id a92af1059eb24-1b5568652e2mr16315784c88.10.1795557814792;
        Tue, 24 Nov 2026 14:03:34 -0800 (PST)
X-Received: by 2002:a05:7022:b056:20b0:160:a80f:3ed2 with SMTP id a92af1059eb24-1b5568652e2mr16315759c88.10.1795557814237;
        Tue, 24 Nov 2026 14:03:34 -0800 (PST)
Received: from [10.71.45.247] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm37196527c88.1.2026.11.24.14.03.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 14:03:33 -0800 (PST)
Message-ID: <d8d31484-03d8-469f-9e1c-521f38393699@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 14:03:33 -0800
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5] net: stmmac: dwxgmac2: enable L2 split header
 support
To: netdev-bot+sashiko@kernel.org
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, lorenzo.bianconi@oss.qualcomm.com,
        hongmei.xu@oss.qualcomm.com, abhishek.chauhan@oss.qualcomm.com,
        sarosh.hasan@oss.qualcomm.com
References: <20261120005243.3724402-1-sagar.cheluvegowda@oss.qualcomm.com>
 <179548403438.3135.1804854034587814346@kernel.org>
Content-Language: en-US
From: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
In-Reply-To: <179548403438.3135.1804854034587814346@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eo5KXYpX c=1 sm=1 tr=0 ts=6b0609b7 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=RiAz6U-1Kj1GQVlvL0gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA4NiBTYWx0ZWRfX/fQeSVkMQNIo
 1wAt5EdfYK1NQh9uWyk7cCTRyYmidP0BrSbYQQG3O9b/PbNo9PuRyem+nVvlF5KK0puW9foZ5uF
 dZN/9nHpv1sPSDC9tLUaU7WX2G8MRv1IGmc4tOHzGcejFSjRfupLgIxfzEbKURpska8alAul2P4
 TylhYKPB2LxwRUYD2H76DgbaRtWWSm7v27JDi2baE0pUrlyXRA8JlK043hqhaQJ9lm8afzCmdOh
 0TeamIpqJr8cGJA6m0rsPyj470RJVolUuRE01iJ748/xChSj9EWMyhri/NSFRnhmmv7Cw2U0tgK
 E9r8D7GRaoakS7g7QWoPKbYCcthFZIYRshVzJqVdjfF4NiO/Fje0oG65HwpSdCj+wNIG/VIfVED
 RlnrXm/uiiwb/ElnlmlZl6je9pHlNwF3w3E9Z8R5TDhkdyTF9NyxjiwUffMde1PBr56O+dIhRVW
 sIpdhnXvgt3oYVzmI2Q==
X-Proofpoint-GUID: PzLLCCYIZrEjsZHp0Izp36f445NZ0Q1a
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA4NiBTYWx0ZWRfX35o6SPvHyUvP
 NNOD3feVpF6MyOYkYm+8wM/W1JJdWSgYwQ0RcgXn9wplX9RXO/Jl3BrIupo0MHg/y8kMciAVQO9
 vM7v863bq6AG+a9uL0gCrgtaRJfVgqU=
X-Proofpoint-ORIG-GUID: PzLLCCYIZrEjsZHp0Izp36f445NZ0Q1a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240086


On 11/23/2026 5:33 PM, netdev-bot+sashiko@kernel.org wrote:
> [Severity: Low]
> This isn't a bug, but should the commit message say that SPLM = L2OFST
> moves the split point for all split header traffic, and not only for the
> tagged or non-IP packets it talks about?
>
> Untagged and VLAN stripped IPv4/IPv6 TCP/UDP frames were previously split
> at the L3/L4 header boundary. With L2OFST they would be split right after
> the EtherType. Commit d10f1a4e44c3 describes the same change for dwmac4.
>
> stmmac_hw_setup() turns this on by default for every sph_capable XGMAC2
> with RX checksum offload enabled. stmmac_rx() would then build the skb head
> from the 14/18 byte MAC header only. The IP/L4 headers would have to be
> pulled from the buffer 2 page fragment.
>
> Could the commit message state that this changes the RX layout for IP
> traffic on existing XGMAC2 users, and ideally include some throughput
> numbers?
>
Agreed. In v6 I will state in the commit message that SPLM = L2OFST
splits every packet after the L2 header, including untagged IP
packets, which were split at the L3/L4 boundary before. I will also
add throughput numbers.

> [Severity: Medium]
> In hwif.c, the XGMAC2 entry and the XLGMAC entry both use
> .desc = &dwxgmac210_desc_ops. So this parsing change applies to every
> existing split header user, including XLGMAC, which never gets
> config_l2_split.
>
> |[ ... ] |
> Is this fixing an existing RX corruption bug inside a feature patch? If so,
> could it go in a separate patch with a Fixes: tag so that stable picks it
> up? The v5 changelog says the fix wording was removed on purpose. If the
> old behaviour can't actually be reached, could the commit message say the
> change is a no-op for existing configurations?

Agreed. I will send the FD/LD change as a separate fix to net and post
v6 on top of it.

> There is also the L2T branch further down. On XLGMAC, SPLM/SAVE_EN are
> never set, yet non-IP last descriptors with L2T != 0 now take HL from
> RDES2[9:2] >> 2. Are those bits guaranteed to be zero for frames XLGMAC
> never split? "The callback is not implemented for XLGMAC" in the commit
> message makes it sound as if XLGMAC is unaffected.

The databook description of RDES2 HL says: "If header length is zero,
it implies that the MAC did not identify and split the header and both
Buffer 1 and Buffer 2 are used for storing the packet". So for frames
the MAC did not split, HL is zero and hlen stays 0, as it does today.
I will make the commit message clearer that the XLGMAC MAC
configuration is not changed, but the descriptor parsing is shared.

> [Severity: Medium]
> Is RDES2[9:0] the right layout here for non-IP frames?
>
Yes. The databook table "Header Length Availability in RDES2"
(Table 13-28) says:
  FD=0, LD=1: HL not available
  FD=1, LD=0: HL is [9:0]
  FD=1, LD=1: IP packets, HL is [9:0]
              Non-IP packets, HL is [9:2]
The RDES2[1:0] AV status bits are only defined together with L34T,
which is only valid on the last descriptor. So the FD=1/LD=0 branch
follows the table, and I will keep it as is. dwmac4 uses a different
descriptor layout, so it is not a reference here.

> [Severity: Medium]
> What happens here to non-IP frames whose L2 type is 0?
>
> XGMAC_RDES3_L2T is GENMASK(19, 16), the same bits as XGMAC_RDES3_ET_LT, so
> this check really means "L2 type != 0". In the LT encoding, 0 seems to be a
> valid type: an IEEE 802.3 length encapsulated frame (LLC/SNAP, for example
> STP BPDUs).
>
> Suppose the MAC splits such a frame at the L2 offset with SPLM = L2OFST and
> SAVE_EN set. Then *len stays 0, and stmmac_rx_buf1_len() skips this branch:
>
> 	if (priv->sph_active && hlen) {
> 		priv->xstats.rx_split_hdr_pkt_n++;
> 		return hlen;
> 	}
>
> It returns min(dma_buf_sz, plen) instead, and stmmac_rx_buf2_len() returns
> 0. Wouldn't the skb then contain the split header followed by stale
> page_pool data from buffer 1, with the real payload in buffer 2 dropped?
>
> If HL is always 0 for frames the hardware doesn't split, could the L2T
> check be dropped so that RDES2[9:2] is read for every non-IP FD=1/LD=1
> descriptor? That would match the databook table cited in the commit
> message.

Agreed, this is a bug in this patch. L2T = 0 is an IEEE 802.3 length
packet (e.g. STP BPDUs), and with SPLM = L2OFST the MAC splits it like
any other packet, but hlen stays 0. As HL is zero for frames the MAC
did not split, I will drop the L2T check in v6 and read RDES2[9:2] for
all non-IP packets, and remove the now unused XGMAC_RDES3_L2T define.

> [Severity: High]
> This is a pre-existing issue that this patch didn't introduce, but the
> patch builds on it. When RX checksum offload is turned off,
> stmmac_set_features() now also calls
> stmmac_config_l2_split(priv, priv->hw, false). However, priv->sph_active
> is never cleared. It is only assigned at probe and in stmmac_xdp.c.

Right, this is pre-existing and also affects the other split header
capable cores, as stmmac_rx_buf1_len() keys off priv->sph_active while
the hardware state follows sph_en. I will look at it separately and
send a fix to net, as it is independent of this patch.

pw-bot: cr

Regards,
Sagar


