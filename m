Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686757;
	b=kOLcIOQQU9h9FhEhEgOKLZg9wRsbOVbE6AP1mO1esJ1uhacJ8QFM4eaiV7MR8uIBHMX2
	 5zaE/gqFEsxssYejfQgStICo8ni7LJTloe3wZPajIZFLzI545ZMSbR/WCz5t8Jo+zLMV6
	 aaO7PJ6C03nVtNcIocMV4dsKon5WTKOSQW80UX+zMPFTZoOZo5sfeEeIOxjarA18ctAnn
	 6bUb2lTENo+QITMgHOXv7+PGH3NPGRGhtBpPWuPFHh/WR7CAKlkobMrecwVZmMMoFPc2r
	 VZBgTh4nJdyhfYst8VQcuR+BtUNk20Y4f+n214R5Y4eNJWtXE+VPCo8P11+EYxM6jLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686757;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=SncZUWGrBOxT9WurRufkDIe8hGFcWm37DANGybHY+fQ=;
	b=UXWBZ60IWLqa+FUy3q7TtOPu1I1h1cahRpPhPqXw2qQw1fhiKcRTLfXPzRJamAeEOxPK
	 lTwkIly/c5kkKaTV/8KyyrQ7TUFe79021IJK8bqG5WwOITWCkDAagGT2ZeKEOtb0VbVUx
	 /Jb/3Gy/VeNJyls62cCMSD4vOEqhtotrkwXRtbsIgHh/d6JmflS/ilBdVNHaYI/PWdIIq
	 U1ZxdmuDBoG/xLHRugI1zBK7MmlOq0msagTcx1iQMsBvTT3MqJkrf0BQr6axiTnKosCfn
	 4LxaHo34D7hPI9HNzEFonuBOt4x8/3MY2awsWFI5TakOxrBvXxZcH9WD03QhLSBM/Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=ZNpsvJMi;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F64606A337
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 20:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7F64606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=ZNpsvJMi
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8b271e573adso1161062b3a.2
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 12:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794686756; x=1795291556; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SncZUWGrBOxT9WurRufkDIe8hGFcWm37DANGybHY+fQ=;
        b=ZNpsvJMizOoFFuviUq3R3I7xBszXKHR6f+dU2Lhp8+AdJOsuucW/Jpjz4DKxOc01P8
         7Bf2gXYBYorSyL2ypHSps7l13uEx7uOW/BQ3oCjgyM7fn4nszFId/ZhifmOhhkUhMak/
         Krv6vg2ZKrT882kZ97nfZeCj+rR5WiJ1p/wW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794686756; x=1795291556;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SncZUWGrBOxT9WurRufkDIe8hGFcWm37DANGybHY+fQ=;
        b=wrme/fmHsp3+5VKXzavsGMYSi+PlpoJR/dy6e1yJYeigQzweRdKvqh2fI5QFZIrSCg
         9BNcU7bjSDNq+w0r9SnDQRUwJvu0uwZo7L3Np6wo5SovItiPhaFElNVLcFNr3AFMVBm3
         Urgd2iYsF5AnTUHqWmPhjzCK1tRI9EiUpE6QXj+NwN6Js6P9zZrkY8/Om4OB8QObEJF2
         ekQTtAg+xbqSaBkORcysYq7Rd865R/b9770kJPt+Ky7tIrUiRCffrG3D+gmgBmlBSP7n
         YO97ERYuXi4REpVZd94fNiUpSWvZ8/EMpfSoRpzO7uD16l0YkrMzv5874/CX9eP+S5Z8
         JXGQ==
X-Forwarded-Encrypted: i=1; AL+hErH/WE2deJqwn1c6ZrlJAsDeYybBA+MnZnyXR4L2oU/o4KKw1Ssx6Z/A1bqHHvwcU7kgFPHtEyg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0tVVdMYRIozf82zuTckAJICp5CFjs9FgdYCrYB4slW4kvYLUt
	H2td8pVRcLLL5PSZ+KjCi4tnWg5cIigxmHXzRilRcoVp0f5Rqx9Kb1/NIQ1LjSHLqAo=
X-Gm-Gg: AYBFou0Catr6byrHMFToJ43QM1qrN1POUmvGto1nYWy0LkBbATVtytkcPJrkJeCCp+W
	ZvMIeNs4H7fZ2CmcUK8962HFgV0+58NAgXhlo9Uknt6+VMSf3fvMgA6a5UudYHsOXf7jxE0dNDb
	02WUwiWvqwZJJnUp1nRPRlM/KhdlDQwYT7C2rj1EgwTdy1H+Ltbd+0BJArTS8aGyt3+kR+FloFK
	/MZRH9mLc9EmOP2N/1bjRJIb6XdKzulvBMXrzC1RGVSXW5tk4UNRVaGCnBU4cC4b5ndCEgCEie1
	BCREnt4BV32UyB/qt3c5iwwSS0M+fpExET5nDVLnXK3C9R6KGfL/RI0oDWLon5bl1imEPC8CqsS
	YHTU+wmqwLKnog0XrkML7HXsorIfiXqciwebAZ3wkZbrSg0sk5HUQjl+bZ/ChuZZ7jjC7Euyd9a
	KeFWaBVe1GYeWSoCu+BYgho6V+4dd3wYgRDMiYDs+1gJKIbBUhXebjE6oOZ9JWgrHKARvTSGrV3
	VAfpbrOtojOVsm6czIjuFZivaUOSC+42oBG3zZySPWYRleP+0p7P+wRuEVqlkOJ+cKk0OiSFmZO
	u/mUcdJxfrOE1qZx/qbkJ41NkMZsNODOxQx2SHAzjP2x1VkWC+2rYnHSjGCgcyDAz9JqLFNYrWb
	rGCBsILxImII8tewR2zLpUEVsB6z5KT1efTpXSZ88ZqabB7zmAtL22H9PH+edjg+15ErVXInpLA
	XvPDuyELFjr2hqCbfbEV/FwO1hFzMuqasXnwZBuwNV8ByUJOwLOyacJCa8
X-Received: by 2002:a05:6a21:748b:b0:3e3:37ff:3795 with SMTP id adf61e73a8af0-3f7a4dbfbbfmr5517650637.7.1794686756009;
        Sat, 14 Nov 2026 12:05:56 -0800 (PST)
Received: from [172.22.0.2] ([64.16.22.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8172sm2271197b3a.13.2026.11.14.12.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 12:05:54 -0800 (PST)
Date: Sat, 14 Nov 2026 12:05:50 -0800
From: Chris Down <chris@chrisdown.name>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>,
	Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
	Christoph Hellwig <hch@lst.de>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	driver-core@lists.linux.dev, linux-mm@kvack.org, bpf@vger.kernel.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org,
	xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev,
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-usb@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>,
	linux-erofs@lists.ozlabs.org, linux-kselftest@vger.kernel.org,
	stable@vger.kernel.org, Alexander Mikhalitsyn <alex@amutable.com>,
	Breno Leitao <leitao@debian.org>, Casey Schaufler <casey@schaufler-ca.com>,
	Chuck Lever <cel@kernel.org>, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH RFC v2 00/42] fs: don't use pseudo filesystem files as
	storage
In-Reply-To: <20261114-work-loop-pseudo-v2-0-98639a2286fb@kernel.org>
References: <20261114-work-loop-pseudo-v2-0-98639a2286fb@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261114120550.0c9e73aa12a3072c@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Christian,

Patches 1-11, 13-16, 18-26, 28, 31, 32, 34-37 and 39-42 look good to me,
so for those please feel free to add:

Reviewed-by: Chris Down <chris@chrisdown.name>

I've also tested 5, 6, 34-37, 41 and 42. The selftests all pass with the
series applied, and a uid 0 without capabilities can no longer change
/sys/kernel/reboot/mode through a loop device. So for those, please also
feel free to add:

Tested-by: Chris Down <chris@chrisdown.name>

I've replied separately to 17 and 33.

Thanks!

Chris
