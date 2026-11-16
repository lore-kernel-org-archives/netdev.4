Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794853271;
	b=K6PPzs2ZPvTOrvFP2W6vnjpFRxCSq1xL3nkrREXdvw6aMnOwhRqCwlrFABTFvHL/to5J
	 SW0Ohv6LVv/cFy6oPNsSURdWWTzjyMuh6OzAYIftJQEk9jOAy/qHdbNUpJbfVv4ZhmINc
	 3Hj5oPLki7kkAaTD8F5qWdDjIomR+FdVYagFRAJxvIndfBfa2suXVB5n3QPSraNvXITjn
	 WxMt35MWpW4vQl85gluipGwLTf5iyZ6Uz7V/qgYbR5NYqIR0b3y7YUXVGoU5evYO4d+pj
	 GNu31uL/ecQom/regAjfuQEbsGx+HAZuzwCV4QZsdCBUTi86RhmAG9kxh1fI2Qo3Zmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794853271;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WPqbI4E7aPhF78xzJBa631u/COojzZ+RvMgbm6UKZ2I=;
	b=0F+qG3gYIhn8j1wUde+A+9/F/MYz2V1xPWXWXVnVSYOADzgQMXnv3cADw5dmzMWDm4DC
	 P5nqQWojRSn8APfImhgPGtPCkuCnDq5Xy5eOnqfFp0ZAC0pZOh4cIPvFszYkso8AlhlP6
	 I6o24eBbrc/AovDU6EasVCspjm0KaofIPfdIkNaMENlMqp2fjKh5N4toE2O8gLscNuJVf
	 LJlcpTIdRvUqYhxJnKeQchpIh0wY5GqnnrAZUqhIL2VsF1CSREIMfq8tTDj2mnxnR5qLr
	 NFL8ryMgc2wci+JUYSPNX7v5sSiA5mDZrhUEYDHlBOpTk+U23DFYsqdPAS/dFseb/dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="PbHWy/OO";
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFC1606A323
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 18:21:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FFC1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PbHWy/OO
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e9e53d011eso34358805ad.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 10:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794853270; x=1795458070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WPqbI4E7aPhF78xzJBa631u/COojzZ+RvMgbm6UKZ2I=;
        b=PbHWy/OO/p6lbs9pGg3i2CMxwEbrtuKliGLYdedBT6TXPPbt31Hgd/M6eFVsm2cldq
         h/4UZo4BITMQgH9DqV475AKu2iBD4n5ShUSaey4NSQy1MBq6O9ic96YTyTn1naEhZ3Q/
         CHS3RIQLxlzHcMGTdN5QRK1+ct/dvIuqAIJcQImStiZ2WNSLAF0ThwL7iCbiywDeptYg
         rDUzR60dRlDSBJk3QmV87gRKa//yp4ipS6/WIzFogO1wVoWwDpPqUvQlqhOEdP6tOI4J
         FVNihNhKN5WkszEhxRgVRTq3i/gIDCjWjzwu9ue0EyPPGAnGaxngVKAQa4xAAf0tkueb
         +GKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794853270; x=1795458070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WPqbI4E7aPhF78xzJBa631u/COojzZ+RvMgbm6UKZ2I=;
        b=ZKjQd4kGt8E4NPRQlKdMNksHOYA7lT3+Hm6jHDmeMyWM0uENTEuC9kifC/I5DOTsPx
         OZesEdCC41EKX/aqZw8aLNoiUvBBWaM0EX5O76hI13H0t2IUoJeXuuarRbwrEgBmWqC8
         LQkBVpZ8Otm4vyJQSKbb4uq94pzojUG2QiXJ2Jk571ERQXwQY1xq5NMUY9blxipA896Z
         pOsNdGdiLmvVDfTdND1FONwubneF6qHcnmm1E9T622HqYt7z1liGhxSVnEigwRo3pxDf
         P0xKbngi6rzXG/jZ4xoylOMw8az3gKi8qYxWb0KeWVLXw5dvtvB6ndAMElw3s4To2Boo
         bj4w==
X-Forwarded-Encrypted: i=1; AL+hErG5tVMGlzQJj0QMQVUzoITtsvmLXvGUETnDyFLt6CEFlkbOlkCUYsBgZXNz7QoeeABwszZDWiM=@vger.kernel.org
X-Gm-Message-State: APuU4Z99lPIufqcVZg3m++NIpNSbISffpeFbjiFBG5EdU0cspiD8Rwkq
	OkHxDFbBXnTNPcYlNMDk6EtekGbvVbVFuOF2MXRzykffnt0ods8cPmU8
X-Gm-Gg: AZFdTZed4ixx78+On1exTpCN2qOF+y1x5Qmc9cTATX8HcfS35dqdAVnZKQFgEd3Zvin
	YEy+CWCEbwp163vjDmkWIwb2B/yxaPqdzv9yY0m2RCxmA9hu/FsxFbNgzTrZUkOHfZSWuWcYHoH
	Y4Q+sA2wKt1PyfKcwpb5QqqgdU5pe4NwdUq1pOF2yZK2SND0k7vcUcJdYBmaQvCxo7HtcFPi+uM
	2BqQRsBNORgGXCPbPmtYtFZTS14CvgQoGRbUN4eKa2sHjgQlSrRDLh76Loz3EEyZIoRtiHrLpfk
	laBZ6WYtj6M4uJD3dSpsmi4j5JfamyPFVPX4pyGOvFky9U6nuiVYKz3YFpNp/VmxcclygR8pwVF
	uKd2PZK8t7F1R8vrpd1gywzwu6av+kE4EwSLKHRRT81TxySadJfcvQ9q/5XNyK8s+9umSzFWoEV
	0QivaHPR2xxlQLDUf12sf6xiJDbuM+uAz7K38OVYV8QMxwqTPkgqtp+t9lkgjaMTZfKhJ7duDXB
	VDUaKBEIzIqWknNDcIxxphLtTzCpBIZioRotDZJu2stYw+N/36hyVmRHFYW17G9nrUVIU5YqrLQ
	sJI45EV++l7JK73xHcjvkQpJUcyeQ8tUqYUudR/8IdhK0okD7FwD9u1TRbMCxgGd/rQ6sbcLevd
	P0X3TxW1KXJ8mAwd7yNbAapkYul+mMPEHq94pXCUXrtL8kfKnfwpV8qGL0w==
X-Received: by 2002:a17:903:41c4:b0:2ed:cab:e977 with SMTP id d9443c01a7336-2ee0da966e7mr123690405ad.12.1794853270245;
        Mon, 16 Nov 2026 10:21:10 -0800 (PST)
Received: from localhost.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a161a3sm2885265ad.18.2026.11.16.10.21.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Nov 2026 10:21:09 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: andi.shyti@kernel.org,
	andrew+netdev@lunn.ch,
	corbet@lwn.net,
	davem@davemloft.net,
	edumazet@kernel.org,
	horms@kernel.org,
	jiri@resnulli.us,
	kuba@kernel.org,
	linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	rdunlap@infradead.org,
	richardcochran@gmail.com,
	skhan@linuxfoundation.org,
	vadim.fedorenko@linux.dev
Subject: Re: [PATCH net-next 3/3] ptp: ocp: add WiWi Time Card production image support
Date: Mon, 16 Nov 2026 10:21:06 -0800
Message-ID: <20261116-wiwi-v3-87afa10a8-r3-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <179456532138.2199510.9610534349392524646@kernel.org>
References: <20261111041904.48916-4-ahmadexp@gmail.com> <179456532138.2199510.9610534349392524646@kernel.org>
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

WiWi shares the peripheral layout, not the PCI transport, with the legacy
Celestica entry. Only the WiWi match uses these offsets, vector mapping
and gate.

I have not verified whether this FPGA replays a masked event. Instead, the
proposed change refuses requests to arm a timestamp, PPS or generator
until probe reads back the open gate. A request made too early gets
-EAGAIN and can be retried. Disable remains available for cleanup. There
is no speculative acknowledgement after opening the gate. The mock-MMIO
test covers early refusal and a successful retry; it is not an MSI-X
delivery test.

v3:
https://lore.kernel.org/r/20261116-wiwi-v3-87afa10a8-0-ahmadexp@gmail.com
