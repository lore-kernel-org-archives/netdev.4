Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795505878;
	b=Fn1pctxVsnqJ7qJrixXKXcwdtxtyCsokeuZlgFr9KIcZqV2BPYqATI0RGzSd6fJfBvDo
	 d8sPMdb92vm6RGVEF0j5mtO6Yh/HZfO6YAGzSs51JyvsEuBC5CXLeSm+RM9QyOOErNW3p
	 v9kTK0cQic++EeEM3FPR6OzpOA+nwUh6NgqgCNGAW3/Eh2k5ZdNLrSfGI3WkXEmwp/Hhv
	 pzK01Qmvvs20GqvniYP62QAx8NaJtGxOasOoEYLi+yfDWG85quXIGOdWDfpXfGkATATDB
	 0v+xFuATKpwdHEad65UPljFZtDiWKGkQLXfJYyTwVLUwD6+X2gWFd75zjhAsInKsGhw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795505878;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WLDBCseQttjsh+YgjaRZ95arQzmquJXtwPce4pg+uuw=;
	b=jpVd0wo/QfcpctZOPujJNXVKhuPyaz/RfmjwZ0Ye3pk+nfAOD89VWbYPkwh5MdhP6XEY
	 0vaYQE/36jYZAa6aB32sCjOcKJoC/W4ZI7EomY3AGTAApdPCgp7y0td7wVTROKOihSR37
	 s74KjcKCQVhEmsvrUJnNoPrPzCX7ToemdgoN1gI3EPVfijn0ZygAW80DbIJfSEP01ojD7
	 4L+KOolUX2aYt0TNZRdlYORTwYlYAZ5HTqdmGVs5Tud4tz3H3c8IXMWOkz4hf5YmREx+S
	 FMGZikpkZYnUSRBtP2vduoLs53xPy2RNxTFhO9rsaNyTbKmaqaS/MrGv3h9ZrCURuog==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jB2OhFnb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S1+Iax5U;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B16606A336
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 07:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1B16606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jB2OhFnb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S1+Iax5U
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2k2Fv4128981
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 07:37:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WLDBCseQttjsh+YgjaRZ95arQzmquJXtwPce4pg+uuw=; b=jB2OhFnb5kcQJfBh
	9PooZCIYHGNUVjDcGwumXONQT2rphRiM+HKb+Z5rBcfoZ9URBb6HmUCKyU398p1z
	0DE3n1unAJCPGSKA9qHqDKxoWrwnFiNfWRaB4F0mZuQ+gIyw7qVkk0rFFWIT+hr0
	xlGvD+nbKD4m1GM6eRm0zn5N+zABS6NWAAQ4zM+xLUUTfkXPLcKrmGNQSuaj6NVk
	LSMFCUkYtOrVzKgsE9JjRJp/p/+NgBxqv/l5UGfpSyCfsEnsySH6HhHWtAFvnFTH
	QiJHfUK8nig+0y+RvbrdRu8nHxWlPz45JWmVSfVxj87VvZ9rM/3qatNGi8g/YvkN
	LVZ85g==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yyt1f1u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 07:37:55 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-67bdee091feso5436029d50.3
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 23:37:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795505875; cv=none;
        d=google.com; s=arc-20260327;
        b=IMtIlj1fWV2tXUszR7GBvXoMXljt3M3GqJ3lroe732C2/LtvbWYUZ6THXcT2kwHFn+
         2S5Ukp4dY7fgwAYmebA7nG928pHJ9gLL1gR0C5fzrnSZKMNuNQ/N+ju8fDejjbCFPHQq
         ExsNkD9MJcf+nvvYm/2wsR6LN+9pkepYF2GNqbdu4np785vtJlYCy0qSkK+yJxDwL+Fg
         PLnZ3+zw9CL8hEpFWy3IsWJ8OKNOf4AVscTbo+X6vPkOGVHAJ0wQ9TJX1lMECZwX7EeP
         j6b6zeG1bFrBl+Q/WjffLGAgJIm9SeUNOQBm7mFh/YiOXoJhkqh/DN38P8bMZ7cXQZui
         qS/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WLDBCseQttjsh+YgjaRZ95arQzmquJXtwPce4pg+uuw=;
        fh=8+9Gp4Dj4Loky55VHY+Dp9K7i/aHEFf7rmzb7djIsBY=;
        b=XgJ287GQcgsnzSEgVyA/RfoC3jJqTlx3pZoo6GcQ7Fy0DJV3x3atMEu4B756Tb4+RH
         KEK0RaaIddd6u2I/IY/QXT+EGmwHANeWr/kC4BbbS5I4L3e8piGP1RWYCYl6xIAEw83p
         1sryPVLYhkiTUrKpznVme0OI8dQOc9lAAFGyApzN6Zmu4I/nqDhEAcaoGVYRhkXp9uaS
         xCPfwKtt9EXmQB+nuXcITpPPdCo1R+LPcITBA3BiTV6phcH7dkWeSXo2eoSMraD6yY79
         EhK2VTh96ow2a46XM0IL4wMy6ONW1iic4pK/If78k+8d1a76i2m3YnGqMmQM3l7sBElx
         +orQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795505875; x=1796110675; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WLDBCseQttjsh+YgjaRZ95arQzmquJXtwPce4pg+uuw=;
        b=S1+Iax5UjwdrBfjmC61+6GR7Ef9vLvndZMhbV6RF5f5jjGfM0fKOFIGSb9cZxbE499
         ufQ0Iw9iW/MkroytuRNTzxKljpJElsFF8w9uRLGP7Avq+RZTb57Ul1XAJRZ5qQA1kqxg
         7jbG878tFdG6DzFw+/37L1jhd6FV1aCc7/cXrp+cfOfsQhmbgR+jpkWB2+0CyWhWN8/h
         yrF5TtN9QZy1tEKAfvOEpPuv5AnxPa6u6OCgoeLhGxjDwK43OfnV/PUQdhSEXPtDxnYS
         FFlkC6lp8vy68Kr1OCdhQERS5xVbG1XGyggIdSHRH/KZmZy1PSroQztV131DD4SIsduA
         xQvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795505875; x=1796110675;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WLDBCseQttjsh+YgjaRZ95arQzmquJXtwPce4pg+uuw=;
        b=ierzgKzNk/Q7WfcIRtRGGRzzzzR/TTOpW6LLzERYbUdOk0jwc9CRnVDuv56jPK0lpt
         A8b9OjDES0oU5GPdXAiDJQXfy3K4S1+JYEMQnGlDxZU0BOHrh3jfUlaZFBtn+NmDhxr0
         iboKNyV+ehxPZYDM6N+JrrfCbKnWMVGGglFT2rIERIedi3DsVK8xDIHUOiMdEgaek1wj
         nKiBRcuIN/cQH+dUMlfXjB+1k8Gjj0dq8+WzCyxssczyx0Ohk4tqzl4V2X4PTvokgx1B
         4G1qF256+bcyRF/HMcNB+hqYKxSqMgWpfWKieazw53WMdmruxPeN78MfUxctFTi3nihm
         LeiQ==
X-Forwarded-Encrypted: i=1; AL+hErHJ+LDIKxEFtfcGow4AGEJo0knIbnhJVV06crhV1OV80x5wpNPfIWXQmeBgC8PHLW2IUN+29Po=@vger.kernel.org
X-Gm-Message-State: APuU4Z9a30luu7SAul2/l6vo1RqSmd6Hfz1G8Ym5YFDzATRk5TASXsgT
	z+1otN4LVd0udHu1Q86D4insn6VPUZzn0LZpLYeTRDvr0WJIB2od4hzp380Zx0AehAiaYpUF+xj
	bG8VszOy3FkCav6J8hlGsEB0QSWVCb2dZkCWmgkML/vtDeops6VyGmeTRVwqUE6e7g2BLfamQ3v
	Tbz4nOD1+a3pkoaf6gyne+pEgM0G0Ti/58dg==
X-Gm-Gg: AZFdTZfv6tBY4uFhCIANP+Stc7HtKYFywC2uc+aO5NaZnJNNGRMJ9LxjoEeGlwL75Ee
	9C8v5LCDCCmyLgyryBC96orilIa2smfv88cA6v3pT5jcE9uGn3imR+XzB72m00yz2LgLbeR2bCR
	wy3DD2V0ideAZBWtaJS/xuCYmWpaOWznBFwiuZMsr0y2EAe9MrgpWBYUIMl2XruL79X6+X4meXV
	Te5MDfm3skaDcf4tmT0Tx57cOfN8OSesDwxYgjU
X-Received: by 2002:a05:690e:450d:10b0:677:cbfc:be28 with SMTP id 956f58d0204a3-67df447c2b9mr2926860d50.75.1795505874917;
        Mon, 23 Nov 2026 23:37:54 -0800 (PST)
X-Received: by 2002:a05:690e:450d:10b0:677:cbfc:be28 with SMTP id
 956f58d0204a3-67df447c2b9mr2926857d50.75.1795505874551; Mon, 23 Nov 2026
 23:37:54 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-late-2026-mmap_prepare-v1-0-c56aadfbab8a@kernel.org> <20261105-late-2026-mmap_prepare-v1-11-c56aadfbab8a@kernel.org>
In-Reply-To: <20261105-late-2026-mmap_prepare-v1-11-c56aadfbab8a@kernel.org>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 08:37:43 +0100
X-Gm-Features: Aa3M54q5vxZ2pH5GHxV6_gcu1Tnc83EBXhtYw1pJ9H77Fl7U3CQoqAKpEumRrbk
Message-ID: <CAGgiveX=Z5gS7iJWBanyysVUStDRbgTnVktQwJySXw_-xL+sUA@mail.gmail.com>
Subject: Re: [PATCH 11/14] tee: convert shm mmap hook to mmap_prepare
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
        =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, Jan Kara <jack@suse.com>,
        Paul Moore <paul@paul-moore.com>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        =?UTF-8?B?T25kcmVqIE1vc27DocSNZWs=?= <omosnacek@gmail.com>,
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzMCBTYWx0ZWRfX7GX6kYOEqZmC
 8Kw9fTG5ydbxtOxVJKSbO/zWsHA6CLQ3C5rpTVYb6eikdp7zOrc7vIA+YJOR8z/JJJ3VITbPyKv
 PRz/FpTBe2jzEbjisv5rg2GDcvl3JFY=
X-Proofpoint-GUID: YeJnb4r2Z9zk9_cYal6A3j07_2fPVUt1
X-Proofpoint-ORIG-GUID: YeJnb4r2Z9zk9_cYal6A3j07_2fPVUt1
X-Authority-Analysis: v=2.4 cv=W9OtxhWk c=1 sm=1 tr=0 ts=6b053ed3 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=97S62Xg_vF6B0O42EdoA:9 a=QEXdDO2ut3YA:10 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzMCBTYWx0ZWRfX329J4hXpsYcG
 NfMtcN6slQHDFM+r0YBYAEJ8AK5Y6Z+srvEubYKKR57EiGLZC0mv4EiWYD5ggTimEbw+XT+TZvW
 fQha6zeFERkMJLICGNgJw4ahQlXDkZ+uyh04wc3WmOfwjSmCvPnLjvX5b2v4wdvZ3Ywksi0j7d4
 ORvg+cz3RfsLZYzAnnh++H4jFeRVZOL+qobInGAinWEXMDtxsrbTTCmizdSpcuRlm80spPGxImb
 odzPI5LeBuSPYEwTqq9qAKuMysgilZawBIRmZjyOkRQ8qJsALJUMNvbOHbwE+bnmr9IEKOdzGbo
 VpWsrkJncri1CpRE8fAO2QBuv2lVvBH7IBxFMhzqmc5t9ejYH1+cu/vqhq2RD4xcYVq8G8MAyxs
 6fzo4NRteT8d8dgRHpNaEr5XLiUzkUDSFhH50fE7i2guWcYi5SOD4MfwnRfsst0tiCkYMH9nez7
 STP6RQ0ORvHkD8QJv8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1011 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240030

On Thu, Nov 5, 2026 at 10:08=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.o=
rg> wrote:
>
> Move from the deprecated mmap hook to the new mmap_prepare hook, using th=
e
> PFN remap mmap action to map the shared memory.
>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
>  drivers/tee/tee_shm.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Jens Wiklander <jens.wiklander@oss.qualcomm.com>

Thanks,
Jens

>
> diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> index daa4af1e089e..8fcbf0232aeb 100644
> --- a/drivers/tee/tee_shm.c
> +++ b/drivers/tee/tee_shm.c
> @@ -567,10 +567,9 @@ static int tee_shm_fop_release(struct inode *inode, =
struct file *filp)
>         return 0;
>  }
>
> -static int tee_shm_fop_mmap(struct file *filp, struct vm_area_struct *vm=
a)
> +static int tee_shm_fop_mmap_prepare(struct vm_area_desc *desc)
>  {
> -       struct tee_shm *shm =3D filp->private_data;
> -       size_t size =3D vma->vm_end - vma->vm_start;
> +       struct tee_shm *shm =3D desc->file->private_data;
>
>         /* Refuse sharing shared memory provided by application */
>         if (shm->flags & TEE_SHM_USER_MAPPED)
> @@ -580,17 +579,18 @@ static int tee_shm_fop_mmap(struct file *filp, stru=
ct vm_area_struct *vma)
>                 return -EINVAL;
>
>         /* check for overflowing the buffer's size */
> -       if (vma->vm_pgoff + vma_pages(vma) > shm->size >> PAGE_SHIFT)
> +       if (desc->pgoff + vma_desc_pages(desc) > shm->size >> PAGE_SHIFT)
>                 return -EINVAL;
>
> -       return remap_pfn_range(vma, vma->vm_start, shm->paddr >> PAGE_SHI=
FT,
> -                              size, vma->vm_page_prot);
> +       mmap_action_remap_full(desc, shm->paddr >> PAGE_SHIFT);
> +
> +       return 0;
>  }
>
>  static const struct file_operations tee_shm_fops =3D {
>         .owner =3D THIS_MODULE,
>         .release =3D tee_shm_fop_release,
> -       .mmap =3D tee_shm_fop_mmap,
> +       .mmap_prepare =3D tee_shm_fop_mmap_prepare,
>  };
>
>  /**
>
> --
> 2.56.0
>
