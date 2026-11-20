Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795195081;
	b=waC2n/A08/9E1QI1C+S4xX0XEKCvkBU3/pj8yJUFd7QzUObuTiulliFZ2ECgQqLvCw3u
	 jHsDn6dv0I+2aqx9wwqlk2bOY8Ligppedf6Dbojcjz8o2jqP7Kn/wd29X+I8yZvrYcHdA
	 o7XUUKTFGZIDrKNzkdHKtaYcazJJC13v7/bz+PnnpVNXnTKT651cZftIIoMHo3pmgAYR+
	 IMjvDZMRBruUN8fSkEsOw1blrF+nZhMI+MOpbbGtfkGEh2sua6zbflHVtRS0PjCFc4Hs7
	 xOdKtvjlKCY7I1dfgOWfps5of6bc4yUtSLrzmCVLIHMlVcR2w1Jwub2azYlBB+SZgag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195081;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version;
	bh=wjfu+1o0XY41QpFEK0UkLoGoO9C3f79CMyE3qI8pCWQ=;
	b=3csNDoN/s14FFFmkcHKlvC7VTfnndMmXvasqnMy75wBcPcR8r6oqgmFH66LS9UgDZpMl
	 D123bo0t0PCEKflBIEAuQ69FKV7nqvT0mxxXfGDpaK4ACagcEGYGILBQuBjUVeriMWX+S
	 ecZr3loEH7LFZrnc/dcQojvR4p9LUcbBfThGpQGwlq2N0yBRZ66oL0M+R6bMloQpwDbOB
	 bntz4rzH0W14Fw+O4na/ZkFD5znYNL3cNWHBK0Ll/Zd62OsAF7psYPHkgwbAvl2kku5CI
	 syDpp8kYWyE22mbvCOjv/reoDSYuBf6rAX8jWuvZ+tdgSTzkM2nj2Gm64ql2MypU9Lg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=HvFsqWth;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07E560A260A
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 17:18:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A07E560A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=HvFsqWth
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
	by m0001303.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6AKGrmf63858396
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 09:17:59 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=wjfu+1o0XY4
	1QpFEK0UkLoGoO9C3f79CMyE3qI8pCWQ=; b=HvFsqWthOwr5IFXRc/Tsjs2JhU2
	waqs9ZKQnjldht7nZxu9zYt3XhDvdDhpIYEfiGJJJrEARGhYqP4wrclpQ6/0EBg3
	lRul39UgevRZgaQs0bGKuvsQi0xfHdWI42hfp2dMFO4+23ry2xekopDamDQ+QHRO
	mXXtwTWmKRWeGnr/fcfD6YmZLWD9v7sb3z+OTz4taeyADWFoc5O08MrAVa+2lhfG
	EBi8+Aae6qA7wuabHWw2J1neVqtl3Unw9VQ1tfsa9cHkvdngACKt/gZSf3Yp+tsQ
	oC4H3peNvc4jyK4lcsQdMFqAsEQWukxa8zbJe+Y9Ra7kS18gy32bPs7JW4w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by m0001303.ppops.net (PPS) with ESMTPS id 4j2t4j06nt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 09:17:59 -0800 (PST)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdb869327e7so1046995a12.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 09:17:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795195078; cv=none;
        d=google.com; s=arc-20260327;
        b=sYhSNKkpVGSKql3zidBeS35LN6qBy1kA0taNOdCP+OfOlQyMElxFIlrphbdVUEd+i8
         qYKwiIpCtTq/UAx4NZA+Hytgp3u1hSWL6V41ZmgL0v9snyY5P74IkcXxFXwDLGzeNLEH
         VHXloLbImKD95iFqu6L5UKGRclgCQzYttQ3d5RAk6PR+CIIL8S7Fd5Yb6ICd+Vbdf5wd
         JIX5MQ0tdQrDxPtO7yavMb2zBAOO+HeETotp7enUzAo20U/82qkUOtS2484PfOEV/UTn
         KGTf6J/Nf8nXBDlPnBRvSXL69RWD6FVAsBi//U0kzoOh11NA/sd5SFXEmflr97JyVeFV
         uLtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=wjfu+1o0XY41QpFEK0UkLoGoO9C3f79CMyE3qI8pCWQ=;
        fh=4XRqw3mM6yDaM9x3Q6bkdgndqyzDA91DOrfGVo0mlXc=;
        b=ndozYEPUpPT3F83zrwpNf6qa+Pl+rEhYHK3rNq78nfziZwjTsRPYiFpj4wyuvAIXla
         WNGxiF83FmPE4HxqnDudDlQBfFnyVeATmlaoHE2iUjldnO6dpS1u5C8QEHRDYO+yQwtA
         V41awVqWkXAxK3w7RlXNLoMh6sfIoviQQABHovv28zfnF4oHtIaH7AMBs3S5dsSwrm5q
         cf+KdTu0iRLOOQAyP9lnkiNGrF2xvclmbXRAKvaRld7TBo2E3HgGf++B1isE3iZGoQA7
         8zmK0ohgGGUjTeKj3jif3rVvJM1gw4u6hqt+9CYY0ryT/YCPodHxfkz9fkx3PyxJdEfC
         iYYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795195078; x=1795799878;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wjfu+1o0XY41QpFEK0UkLoGoO9C3f79CMyE3qI8pCWQ=;
        b=jwsasA6lBbzcNQXVw/tu9Xe+3Zm1MDwbIPaEUcEusX4ZottatZd4rclIpY0ea0Hjoo
         uOvtJfR54OKn3Tx4MpJaP65VcnI+1mNj+Jhqnjmc4nbXNYagjGTuswFn691ExVUCg//S
         rypF7wS2t4Zar7haLgbJzPrQdErlUuRiyz7aoH/Ja8UQnx6XBGx5Hydssgel5Je/pqXD
         Ml95q/sqwsc92GPCsrnPp+QlgwMKsSHn9sMRf28fDh+WPP4tKJe8H6PPQ6tPRaYvTrp8
         aF4ZhlJhc3vegHOf6/ROchOCucArIJOJBJyqd6MIpv3HgqpWXSSopb5zRgt4KfW7jq7n
         3iiQ==
X-Gm-Message-State: APuU4Z9kc8v6ACBR6DzwJdk8q1Y+v/aqSg2Ib9pIZlmVpL8tsgZjmo0s
	mHJnmzFGR3azj6zPHT5k/gHVtwzJ1Rh4vB8cxCmwizbrBSiGBt/nObSCQeQKtVykwtMTpjGtzey
	K0bf+x+kzRufXKCEkhcGR67w+EdvNr+7Pzg8U+QHAOwFbN82uf8H1HdVJamHV7/m40GpLCN9PKN
	3uqCFHB5aZ2oGM8736GYluQ2NE3so+2JQ=
X-Gm-Gg: AYBFou2tbPhUmWaXyUayckNnPYIcisjOoUyc9RhDiZkxFM1vLrQLrYoLv/QdQ+Ik9nx
	xPmfg8PIucdAc73OyHBTzVpiK+F9j6Syctscc3rnrO9KL3Of7k5BIDeQwFq9g1Ufti/a05KpOOI
	qPh8sT0wxBZ9hacuFzPHDPgdW6qUYrwws7nPcVSAw266aDmHG44ijZjuJ0x/s2DjzIm/5/p+fjo
	cU7muBU/eEudXWrz1KWweSqVvs1Skis
X-Received: by 2002:a05:6a20:9f86:b0:3eb:39fd:bacc with SMTP id adf61e73a8af0-4014d360ed8mr3745360637.50.1795195078579;
        Fri, 20 Nov 2026 09:17:58 -0800 (PST)
X-Received: by 2002:a05:6a20:9f86:b0:3eb:39fd:bacc with SMTP id
 adf61e73a8af0-4014d360ed8mr3745344637.50.1795195078192; Fri, 20 Nov 2026
 09:17:58 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117203137.804424-1-toddfreed@meta.com> <20261117203137.804424-9-toddfreed@meta.com>
 <906302b6-facd-43c4-872f-ae40bc59714a@nvidia.com>
In-Reply-To: <906302b6-facd-43c4-872f-ae40bc59714a@nvidia.com>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Fri, 20 Nov 2026 09:17:47 -0800
X-Gm-Features: AclHuK-LgS6otYIsEJ3X0_WptWHRTeRKrRZOhEbdUdT3ro_BhN8Q7OlgsXmfnZs
Message-ID: <CADh2yMzLDMEOupGJwS8=3JbN-g4LR3ZapyBNaJx3chNT4_6pDw@mail.gmail.com>
Subject: Re: [PATCH net v6 8/8] net/mlx5e: psp: tso: replace only the length
 in checksum seed
To: Dragos Tatulea <dtatulea@nvidia.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
        Boris Pismenny <borisp@nvidia.com>, Cosmin Ratiu <cratiu@nvidia.com>,
        Daniel Zahka <daniel.zahka@gmail.com>,
        David Ahern <dsahern@kernel.org>, Eric Dumazet <edumazet@kernel.org>,
        Ido Schimmel <idosch@nvidia.com>, Jakub Kicinski <kuba@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Leon Romanovsky <leon@kernel.org>, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-rdma@vger.kernel.org,
        Mark Bloch <mbloch@nvidia.com>, Paolo Abeni <pabeni@redhat.com>,
        Raed Salem <raeds@nvidia.com>,
        Rahul Rameshbabu <rrameshbabu@nvidia.com>,
        Sabrina Dubroca <sd@queasysnail.net>,
        Saeed Mahameed <saeedm@nvidia.com>, Shuah Khan <shuah@kernel.org>,
        Simon Horman <horms@kernel.org>, Tariq Toukan <tariqt@nvidia.com>,
        Wei Wang <weiwan@google.com>,
        Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA2OCBTYWx0ZWRfX3LIl8xzq3jin
 DSqVzXeR80iC/FBDDxLc/5IQ2UBF45XQ1eYJQwcJkvs34B5WT3+6vp+lmFyWbMMJZ+eylfymZSz
 oI2pvfn1umz4DbU4hNWGUjcWSCdu3NAX+FutIeIHm/ckF5xXGFaoYb/qGnNEJdqk64ti7l02jY4
 71+8BRo9hc2Nq4eVfKTruo67oM3kGcQ8QEi1QTxjLLFL8LbSUPHYd1jRYtBffP05TB55Ep6Od2i
 nvsxRTUd4odJDe+cOWsM9ddYS+NJV0z5hazfRbzQjdjAK3heyKBBf9h2g6mdMdgvOOB4Tu7zco7
 kpo5tURx3/Zq80s5uVmbdGX3b8qHcj7amMjGYWIwwfGVQM/zAZaQBZOwQpxJG8ZSRU2YBicMnHA
 r7vMsJvRxMSvR039C0LWQC35hZXd6lzZKetSNKnE1ptLGms9fjRYIKLNGk3/Bxl6XqfYixHa0Ni
 GqjSuIUPhAjYrHhadrg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA2OCBTYWx0ZWRfXys/i6e0L2YYx
 2Zy+f/fGwA4Ol4GYlqdSEbPmitD7XK/btEiLdDwje1p5orj9F+yem1xHvrUSWhQMJzjM6Q24WtY
 pGXRp46ealqR7liHYbVGyA5CzP1ho7I=
X-Authority-Analysis: v=2.4 cv=JI+uIMKb c=1 sm=1 tr=0 ts=6b0080c7 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=_78whYxrdx1mplLwxq1U:22
 a=OFRVtpLxHUNKrmO6MooA:9 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10
X-Proofpoint-ORIG-GUID: juh8Zmc_c-hIe8ya4QF5jbYZmm9aJl1v
X-Proofpoint-GUID: juh8Zmc_c-hIe8ya4QF5jbYZmm9aJl1v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01

> > in these cases every segment of the tso packet to go out with a bad tcp
> > checksum
> What did you mean with "to go out" here? Goes out? Or is a verb missing?

Sorry about that. Here is the updated phrasing.

    In these cases every segment of the TSO packet goes out with a bad TCP
    checksum.

I'm not sure whether I should re-post if the only changes are grammar
improvements in the commit message. But, if it does get reposted, that is
how it will be worded.

-Todd
