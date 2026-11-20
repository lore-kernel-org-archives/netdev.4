Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795135570;
	b=hROeOCvdSza72yEbYyuIeBTpY/oXZNJwgipCJH1a+ZuzWhlj7GOvN873g23wJNoYSM0C
	 K4bO/P9mHrgHvpNHxM2jqDdzxh9Sn3F24sKCb7kFFM+Vb3kREGvGaQg9ChfX8ac9Yzk23
	 1wcVLWkKznTcFShUDiYebB7r3chviMWdDSvTl4x1E/RwTXwkHvigACNtGjLCzjIOCyDKh
	 HZCPVgI5v0CCK0x/Wm8sqAl2zCNJfNBNdX4cUMZ2Fvk2z3opldC1X/mMTabQjRtfssIj9
	 zOohGPhAsTQsyT3uhQnbkFTU8HBx8+nT//HsSl9OEjl67HkfugbCgNiZwzAWaY4C3Aw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795135570;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version;
	bh=0Wk1fOxDDLV4UZ+GtYR1Hq2j6HZ/VcU5vNNYnE2q0m8=;
	b=NhFTj9zsGb+KuKOmVgBIzeKlY0cJGYF7XVGtCpMSwQhTKmiRxaDlcHey7w295Wm24IWI
	 55GYGoaZ6XefszjTcNlaR7ZCwvCOMSs8BQb9zBsY8HQQiuX5CFAFZZxcWkdCtkUWXX+Fw
	 zIkFoCvaiZkb/IzYsGL16bx6rVmLpJ6F7XTR7FDSlKRE41hvRI+MWCAMkKvhmSnvjOCA2
	 pw9dqpWIvPJ2B66C6BpQaPry9U+oIwfeyWJtLHJ1IDkO6Xy1RtpUganhuVwVM3Z/fzPVS
	 gVcVMK9hVW1G2hlhuiZCg/V4dVDHMI4KGrUjuIa+BS4n58+JArqT/HutbPmofXJleJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=NV6sU6jJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B8C606A326
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 00:46:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4B8C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=NV6sU6jJ
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
	by m0001303.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6AK0Ei0A1864879
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 16:46:08 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=0Wk1fOxDDLV
	4UZ+GtYR1Hq2j6HZ/VcU5vNNYnE2q0m8=; b=NV6sU6jJZ0mpnUMoIb+pL/HH7xK
	a3UwfYHXKTyMkhahfD417ja4OfWndYESuBDx66rnAVDwPlQLHoHTC+PUnUzHSyNg
	EB9BCAch75SL0RfF6TMsOX3rsu6ySgWFdV1qO1pjkotz9t14GvdoSy2B1VQ824cS
	I8U8XdHNz9p6hG55YvQrdcpQUsH2Ha5jOuqzB1secBKPU6nIK3jqLOhVT0CGQv/C
	dH1uV/DXEjr0ptmtWBbWrdSF0UEPWiDWP7Cu+3e0971fV6/i87OrBnt0iVKDTW+l
	Jnk+o5k/2+7A9//ciWeuLqSmYKAeNlyay0fLuty1auwFGXnBKk/YjVP44yw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by m0001303.ppops.net (PPS) with ESMTPS id 4j24q24b70-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 16:46:08 -0800 (PST)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8b6463f95a4so350570b3a.2
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 16:46:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795135568; cv=none;
        d=google.com; s=arc-20260327;
        b=YBOejOT8Vr03dBcGgcz0bhYIEcpQLbP5t9msMFzeAYZadSOtqodeByYbbs/UGQi9oO
         MC+kl0+/nIz+Ao/T6OTN65QsRzija4B7bUPKJkFMjNVBPjc0l6aFd+DVS8X0oERWhA0S
         x8++ahMpHVoK1fJMH3DLSEIfyQMkEY4RjciYO2wTSpeoYd/eoNZ4FB63f7QZdKanluWg
         cl5z4miCsLRh4dHIE8Chhyg84zxxxtzK9MtfyXEvl9WKvzfGgPnUiXMF/Lxce87wKFAS
         BVqliX0ljUAiksGUsD9kg7tMVeFNWhe8U4zG6gEQf6LRgcQeVHJVRjGLUkrYAe7AC6wn
         TUCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=0Wk1fOxDDLV4UZ+GtYR1Hq2j6HZ/VcU5vNNYnE2q0m8=;
        fh=6LROSVmOrTZCjcgY3aFRbwH6HYKu87aV7OimeDx2Ejo=;
        b=B7Q7B1TaF9OfZ7CKbNqQ/QIn6snzuDgZoBc2aelZfTIhAgybHB99FXrZqONO7KMYuc
         mQuscmeFFE7/ZIzW61f3twnrm4C21yLM7KlIDbGPFJ6bJCM9pi4s32kaTGdMKmP8AYIa
         AoPHPiYNvO5BWH7Iq5SEI12X3dNcRb90HZI/RodySZQUJV/7/uRP70DoeoTi/8FzyLkx
         0cN4eCw4WWb8lqt/WK7WgjefUKY1Qq0RtaOYVvhP8SlXs06M7Z7hhfKA0HhtHyZRDrgV
         cUWwZBAFPIsliAV1wmmBLr2YfIkY/BToJLfSjWWlAsmtkwnqKXFLxur1o0hBj4gvsiVL
         VXJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795135568; x=1795740368;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0Wk1fOxDDLV4UZ+GtYR1Hq2j6HZ/VcU5vNNYnE2q0m8=;
        b=FxB1joIo22PRP2Qtcxid1Y3Cz0u+qH6A0dvyJYuRT8r1b472s6DPTULTbqFdALjRtN
         mNbbZguebUYpWopLwfMt1rozQP/Nq/jo3xIQPLM5KMIMwL5RNXzArppJmoyXSLqPnT+5
         Iw4JCx9XVn4tX8aWdejPBSqB1l9TElV3n18bqWbSzCzJE33wjpqRy6Lk4A9XYiHJ/3WY
         Oo2BBDkJc0INUwz3LRQSVO/i+w8dVK5W8odb91xohKEXl4yx+Cd/DAPhl/kouWXMYQag
         6JSzTa9teuCK+TY30Ewykqr19ziFVFw9DXNTy68sbZRYypLE4jxqGZIfLydiZN0SOg/E
         Sgjg==
X-Gm-Message-State: APuU4Z9kItfz2brrHBtLemoZzSKnVOHqgbwnbUMiZRSlUK/+LkUzFRRJ
	VNJ9dmAgxVGOZzniqavJxvRYPZ/NUZ7TJvf7sr+j4L96z6sl5T+A0xWHB8aBCao6XF6c+mspBhe
	UQWQQhxMaP3hrgVUDsAiX5zTY9xcsXowxTkbbt/RAmxcHzb0BAhjMBUsngbNxv0WquZh4HtuEqJ
	+lQsEe6cdMHM+WY4OKLhHc2pA6a7G0WVw=
X-Gm-Gg: AYBFou3i6tgv0w+FN7bozuHGyTg2nbem/7cKuqqxVG1sqvPVWeoTN1S4uY+xIljp0Gc
	MTTXipgbgvhcQ/TruEb3Qk28u7nbsI3AULyQi16HLxNRlqUSXtmdnVYAP3ie5Pz0T3DZGhR1KFt
	WHXTkdvrioSwANWnHURVtofChgVvMIIT4xBoCN6J/ZPHBcGbTIRhIduw/ZnlcMhgKlAdlwb5LDV
	GLBK643a5fYAeFSJc28QjghGT33xp+G
X-Received: by 2002:a05:6a00:8d6:b0:8b6:400d:7cc3 with SMTP id d2e1a72fcca58-8c87c67021bmr1122505b3a.27.1795135567621;
        Thu, 19 Nov 2026 16:46:07 -0800 (PST)
X-Received: by 2002:a05:6a00:8d6:b0:8b6:400d:7cc3 with SMTP id
 d2e1a72fcca58-8c87c67021bmr1122469b3a.27.1795135567119; Thu, 19 Nov 2026
 16:46:07 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117192411.247117-1-toddfreed@meta.com> <20261119162146.28229969@kernel.org>
In-Reply-To: <20261119162146.28229969@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Thu, 19 Nov 2026 16:45:55 -0800
X-Gm-Features: Aa3M54qP1YCQf7NpHxLxwgOH9sNuFK0oZ-H3E0wPLjIaO2Wa5zKJBx45I7vhaDw
Message-ID: <CADh2yMyEv46Ms1ne7rDWEJ6EFxQTe_OLnW4-TDCRSWusPoodVg@mail.gmail.com>
Subject: Re: [PATCH net v2 0/3] net: don't redirect decrypted skbs to ingress,
 psp time-wait validator
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Simon Horman <horms@kernel.org>, Daniel Zahka <daniel.zahka@gmail.com>,
        Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
        Wei Wang <weiwan@google.com>, Jamal Hadi Salim <jhs@mojatatu.com>,
        Jiri Pirko <jiri@resnulli.us>, Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Martin KaFai Lau <martin.lau@linux.dev>,
        John Fastabend <john.fastabend@gmail.com>,
        Stanislav Fomichev <sdf@fomichev.me>,
        Sabrina Dubroca <sd@queasysnail.net>,
        Boris Pismenny <borisp@nvidia.com>, bpf@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: JbdN_dGNVbwzbNiNPZPR-LkP9pV6P0Rt
X-Proofpoint-ORIG-GUID: JbdN_dGNVbwzbNiNPZPR-LkP9pV6P0Rt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAwMiBTYWx0ZWRfXyfBStVKr8kOT
 9ZyS6mM4ti5V0pk6SHkTgJi2+b07N4OQ2DEAMIEnK/4mg4elNHYZ/c4KuUrpwNR0I275YD0auAU
 1ry+XX/OtymErsqKiBn0aMrLzOECW6kW5/FdIe7nt7XsNvi1Cscq3JR292ghhYQJhkDCNuUIaix
 fKn5xGNOZi3G6yrAKq1P8RTBio23P2nLMLWJNkBD/QFeGvPzcXHxVxYYtgrRd2JwCX2Ub2wLtUv
 tMSW/zQVH8zyXC6m3Enz/YgjACmr0TnmKwYdFbH/QVTomoEsWh9S0jFPvzsYmL0pyCAotox4m4s
 2Ld1dfWmUJbnP100kypGk7HoNqDuGfTSH1pm1MppOD3UlsarW87rGeuSRyPs0RQ6i8i7f+/iKLy
 wrg4GKVl6lcyWr+bY3p8X2B70TlR6vRnwVzaNGhJqjmHGPVmKqc13mKFHWbgEU2sbtr0AV5djYo
 VKxkxjKN4oOTtBI0d2w==
X-Authority-Analysis: v=2.4 cv=Q+NHcI2a c=1 sm=1 tr=0 ts=6aff9850 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=_78whYxrdx1mplLwxq1U:22
 a=uh9GPBYV2gxs7o8O5dIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAwMiBTYWx0ZWRfXzBHexWBd+Vd2
 9gUFzGKKN+WqEOlKS6xcbGHMCsKR4usO5ojZzb5yYEVJgc6613wbkbbKpbRQC9a2ZGlHqhUq3Cn
 obmIoJ4mkJi95nJ85qhOtVlShbod6Jo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_01,2026-11-19_01,2025-10-01_01

> For future reference - there needs to be a path in net that hits the bug
> for something to be considered a net-worthy fix. Otherwise no Fixes tag
> and to net-next it goes.

Makes sense, I will keep this in mind.

-Todd
