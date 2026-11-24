Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795500517;
	b=PLpp/FwoF0eqxIGKrHAv8XBtK1Ewp4NSju4cres2Szs7tZIOzzwX7QwVMruP7rS0rFPi
	 xXmzcEh30c17HzB4xcuFEmhc1TcDtIM38v/GYwQdK1bQYY+rt6Sl2aBawhuc33ZjdJeB/
	 oV507GmbowU2ylan4QCSm2AFE0rmHerh6fI85Jz/YfqeWjHEuVfvrasrsvvN7wCAha2ZA
	 nW2/4JWCmLsjlzCj69Wr6ddCk6K/Kj0rOUnJuvyhkF5/KwsVycCCTSdNddhGgnU2OiAXY
	 Dcwcxaj7oyvphqcpT2IhrGrPVLc3DE/Tj8NEsh86DxCMYpSaPWSKcBfvSok025Rs/Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795500517;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dvY4KBfiISm+CQm5KIDUrtb6uzBgUaP0PFQaZpqv52w=;
	b=E5aUpAvcplnuLkKbKnqnoWYq1PvcO9eITmEOhIhLeIa47RlTWbbVTvs1giSLlJhQlQlt
	 7j3pEN3ljg+PbGzw/ZW3B9XJcDwLbGac1zq9iEwZgZEmEQ63yF8sVGhFa7Eualzz/9SHG
	 iJIDvXYCUZ29EoZXD7R1Tgb5ZjKj+6+73cF38gStsuBWTeds0Qq95UOA0KvAE3kPexFe2
	 5/gNa/JyAIMX/CDEqLvdIh2rbyDhvQf/+YLb8Af9HhQx1MKez2EexRhnxpdobe5qKrpnt
	 xDkhXP1gKTVj7VnB3yQ6Zuin9DyfhxP5zBr9x8eWnq70iTRAJM8ww/Km5xTSzmWzvBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mu+lZvdL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZGO29w+k;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1973606A32A
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 06:08:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1973606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mu+lZvdL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZGO29w+k
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2l8w3016825
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 06:08:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dvY4KBfiISm+CQm5KIDUrtb6
	uzBgUaP0PFQaZpqv52w=; b=Mu+lZvdLXuWGpOkRTkHFjM/i3/zxBEn62CaGxwiM
	4QAwVoT9XEi4yAVQyTS/Hdf4oK6g4Bc9UAYdPk+DRdycbrtCTJCG8mMPRAhd8Itr
	YJhqFMUPxIvAUoO28f/gr9kwh8uoUQMFVNIJ4mHntvWYoUNjLLZJkNIL9C5NO8j5
	4wzwAtnHxt9pAGjuHvdm/dL4ZGq7SYRNZIslZ6b/jAPWSWpvoexho/kIjWyCe8Go
	XEM9WzZZfx7YDi8VBJiRGkruQKiQYtAWiuR5g/M2YJX70BEeqYi1vnUAfiYQx25H
	1Q6Q3rvSf1diwPrHavfw3ko6BktLi1o93wWElVUR6hp2Ww==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4u9nt6yy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 06:08:35 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9210a12765eso33428426d6.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 22:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795500515; x=1796105315; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dvY4KBfiISm+CQm5KIDUrtb6uzBgUaP0PFQaZpqv52w=;
        b=ZGO29w+kZqFi0IoremOsMtN9bKkizaQT53H8YWFQDHShgC+v74I6+QopxA9VOzR3ag
         vpo8bEUIF8O5RsZIAg/OLAqOKRB/bKTx8+cSCgApxKM12o3xffG44Tb8wjTZkSkRmxCp
         wij9c01WUZzaDr5rVDD1SJT+iGxhVY2DGrilMJockekBI3nIm+ySQCHW9FAgGT1TCkED
         cBg+mmrXK3wzCDdfn6tJ9MkKWiw3B/ZXVhgrV+oDdRaYRTIjpBAkDMZ/VMsXJhU+E1Kt
         SQ9c84H9SufIQJjJDyuIlA/LWh9gOMXMRnrjdxZtJ49QfcTz5Lm9KRTSNNNdk8bu9nwV
         oZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795500515; x=1796105315;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dvY4KBfiISm+CQm5KIDUrtb6uzBgUaP0PFQaZpqv52w=;
        b=hGtt0ITq1/QwDJk6RlOpqOYyzxKIj+5aCxAeRrr54MfAMau+50gXy8EiDlDvd8JRs/
         r5exZDf7GydtPEjxoEpNxUU9GR75wA5dFDN/jhjqDLe7uRkwJ+7WL6XCRtdS+KVXjJx0
         FzNdtgjmErUgCFLpzaINuFsb7vD1nIKWx8wSgAp6Kaen9Zm9CfcCibOueB26LiLNYLSp
         LyJWcS1BkNtmdx61pxZG8jssXnksz8B0sQY9sFb98HwNYeEzWTawszoXrZ5DDms6CxG8
         ZH9f3Cbr5kBp2h/oAMaMfKns4HkvcDnUjq13ftx5gAna5T1nNxa52K5b/LRo13CfkWfN
         JpMg==
X-Forwarded-Encrypted: i=1; AL+hErH1GitV9OzPdpUbeNsDkUWFJQY+p9RIl+Y75bNoSTkDaw4Z+dqSaljQGhl0cjQ0gidwFbctjy4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+6LyvZbO1gjtAriZtUsh+2c8qGafM8wNIOeS69uE9x41fKf5e
	/5pcVKkig8Yl7D9vMd/ctefPNnyjH9Gmm79MrIHDl12Bnkei/IRazOz0kPiKpDmmXOETWmU9hpg
	0aHuyAHjvaCmkmIRYIkVbCOCkBM+I3OYnYdSH6GgwHVEKoqEHImTWLXNLVs0=
X-Gm-Gg: AZFdTZdFM8MJPGZCH4vg2e1AlEL62T1u/YhnQg6uAes4ERwQ8kzv61HNMx4iQcVQLT+
	mDab74IqFeUMBoEi+iIkx/KvFyx8A7yBIHts7fDdZ3co8qofqRPyNMTL2aUOKYzJ7BNSKWfDQbP
	RzuxvwHmO7w/gOcvJdusrq+fTjZbyMjVmfvnvOL0K4us7VTjFNOmTGfryuLzGYOYpIFKif6Qn3W
	0HPfDKWaY12tE5eA711m3SVXrk7J62lIr49JWI21ph+hvp9YKP1Y8mXRlrd8HV/S2PvTckySVI7
	12ce/NbRYwbmEi7wd3wM/LYoyyP85peprr+x1XmgYIrIzjfTwaQLpRLp1/dKThgSZszziiQivcB
	8VVEGEo+LtxZUk0z5XByJj7bWCXPC+2XrKhRlrkIMhThIPfYM5kLVBgYyZptCRrM=
X-Received: by 2002:a05:620a:3185:b0:93e:94a4:a97d with SMTP id af79cd13be357-949ba683204mr2433057785a.0.1795500514632;
        Mon, 23 Nov 2026 22:08:34 -0800 (PST)
X-Received: by 2002:a05:620a:3185:b0:93e:94a4:a97d with SMTP id af79cd13be357-949ba683204mr2433050285a.0.1795500514001;
        Mon, 23 Nov 2026 22:08:34 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad644140b5sm23005124f8f.17.2026.11.23.22.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 22:08:33 -0800 (PST)
Date: Tue, 24 Nov 2026 08:08:29 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Shrikanth Hegde <sshegde@linux.ibm.com>,
        Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
        Dexuan Cui <decui@microsoft.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowangio@gmail.com>,
        Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, Jan Kara <jack@suse.com>,
        Paul Moore <paul@paul-moore.com>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Ondrej =?utf-8?B?TW9zbsOhxI1law==?= <omosnacek@gmail.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Jens Wiklander <jenswi@kernel.org>,
        Sumit Garg <sumit.garg@kernel.org>,
        Scott Branden <scott.branden@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Richard Cochran <richardcochran@gmail.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, xen-devel@lists.xenproject.org,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        kvm@vger.kernel.org, linux-hyperv@vger.kernel.org,
        virtualization@lists.linux.dev, linux-sgx@vger.kernel.org,
        selinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, netdev@vger.kernel.org
Subject: Re: [PATCH 10/14] soc: qcom: rmtfs_mem: convert mmap hook to
 mmap_prepare
Message-ID: <7zkdydihgjnqxerwzbebrcryry37hcqc47dpzqmoxdgc7qt3i6@uanst4lmvvkn>
References: <20261105-late-2026-mmap_prepare-v1-0-c56aadfbab8a@kernel.org>
 <20261105-late-2026-mmap_prepare-v1-10-c56aadfbab8a@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105-late-2026-mmap_prepare-v1-10-c56aadfbab8a@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAyNCBTYWx0ZWRfX3lP5t+UqCdTW
 lzLt2q1rgG6v0Zful1ZHI1kwdsih7agqTXa+firMpMtvgj2d+JZUvnDtNaqoX6ZqCeuN9N9POLy
 ZITFMSUaQrqtLuKScAixfH0V8IZqQaCVVyAknQYouFFE3juqglMb9gL9DaMg/Pmy9vdC5miI0yu
 b7nm37s3xpTmmKJpZZBLzpeF4KUuZh56JxKaqoWbBfo0tBqwtM/rRqfLzi74u2WXev1YDDffSfM
 eNis6MXEe2a0tNy5xpBvPGQqvGuzZ7qOHfoI7CZ72S5Lo9rchZylnrRHj6cU4nTSNJ8WtwqxBgt
 gi/b9/X96+5sLygtYfAa8Ck0Zb37pKWX6dCJ2pdLm3bvaSiHBcZYt/STgPrFZrOs+7xwchaqZu0
 RVfM3FMW622bm5MXoNZDxFSzJlgCQNnCJKRBG6RuMyrMek1PN81T5l0lwg8pMzAKYKOc/taRsat
 VdmlmLxK5YK62o+ljUg==
X-Proofpoint-GUID: 2gPm4i6tJDy_yTJMd6VDLcd2zwsjE0Sb
X-Authority-Analysis: v=2.4 cv=f4ndl+yM c=1 sm=1 tr=0 ts=6b0529e3 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2UNkV1bVvYdQOko7pskA:9 a=CjuIK1q_8ugA:10
 a=QtEvL3ry9E0A:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 2gPm4i6tJDy_yTJMd6VDLcd2zwsjE0Sb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAyNCBTYWx0ZWRfX5aYH31RVNpEW
 ZFY0EuzmbfgdYtPcDcvEcg2V72CJQuGWoEM9oVfSNznS+P53mTRGd/DphXVe4vCbl5mmBUJHJJu
 bk3kUfSWN/iTbAjel6B2lOMPtAdLya0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240024

On 26-11-05 21:05:41, Lorenzo Stoakes (ARM) wrote:
> Move from the deprecated mmap hook to the new mmap_prepare hook, using the
> PFN remap mmap action to map the region.
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

LGTM, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
