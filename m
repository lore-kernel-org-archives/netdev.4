Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795091591;
	b=0S1bfy3Gi5NXBtNvzoJIBmhxpJ/1Pw1lxqy8Fj7yPZoWWmG6piWS858+Rbe6lZbu7wWM
	 RtitERa+fTNzXXNrl5Pfl7Oowa7e0Y50cBX6OkBKv3/3MGbfKniCp5hwB+teBQmVLByJB
	 RoecxEawyKqg90ZUs4sqT9dHUDso8VQQ9ay3OainC7Uz8B3zEawSWPRbJdHhQW9aO1TvP
	 eI0alD1HSMcIa+yIDpJPhHLm9eKPyxTUbBvof8c8zFv+5PuIrJhVY79H97pbgK8cYVkQ6
	 0O+XqJNrO628QXV1iSFXxoWfnrtpToRrXF4XkDWT+yh8l4RBZxftjCJ9y9TpiLhateQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795091591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/Ek51XyDqjNDlPqGg9sQ2tY31Qy1aTTiJyOPg0VSi+0=;
	b=tUrXdG/e9o/pLPwfTTfM/C16XxpJsIDyQKq3EWpvlpPcsdfmUWAIBOrgXfVBOY7iV3Ml
	 QO87thlPMb9P7ML3r2HoYtX9JiDMkc3ZMoZ3K0/0FAszRdCTyQOQaFqKFL3YVbI+9iQTi
	 4FK1NVoW4qr+x58QTeNY7urlrk7dLiPGmnERQVunR9h8m0sLFs0d7secdv3V+5d4r02qw
	 8zWD6u5o6n8wWhfZhZhDkhVHIYA9dMlHRzvvoIyq1ujGvFwB3fcX51u71RfjWQDrSlKVb
	 i/ydkMdJoYvUCfF4vLs40o9goLwGN8U33uSqKVPKdFOTLqElwwjtz1PgbSF5MWBmVkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uBYexjBE;
	arc=none smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45F1606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 12:33:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E45F1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uBYexjBE
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-55d2b4a99d4so19460781cf.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 04:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795091590; x=1795696390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Ek51XyDqjNDlPqGg9sQ2tY31Qy1aTTiJyOPg0VSi+0=;
        b=uBYexjBES7Nf6QiHlndF8Ui28b0z6/g64un3On2W89+fozFTQDUSEf2bEPEtd7T5pM
         eg3n3ZZxVMd2jbzC5ya8OLwGMi+VKqz5hj9eOvOlYqGZYjAGmgm8wymDya7TYIKr3slT
         vDATIC76ZQx7z8cwBByKunj9tfoiMatxWj2ztHkEiyJFts0q8oCpiuRbx9JHcpycHp0l
         MDlIDX1i1BvnMfCbTsRegYWaI4wSVO45A2mPir5aAr8TNLrzf7lHyagID2IyYPny/JRO
         TvyrGi+RU7wPXYZAsGTTa+mzT5EnV4YIsaxmXTDeAmu18B0yo8aBLa3bml4OZgle7l46
         6d/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795091590; x=1795696390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/Ek51XyDqjNDlPqGg9sQ2tY31Qy1aTTiJyOPg0VSi+0=;
        b=2fKhC+Pc5YH32HsPR34t3tAB0PnQj+WIPVYz4C0xYoed874rYiSSj57apTxldzsJqu
         jVIvseFTzbeLCi2+Y6wj8htHwKC2ehoLzX8IRhRJ5JZ8jQiMB69zXN+khq1GAj46F8QF
         oTZVSX5upeg38TNlTInWsJnvEjXnlZDUVlnZdVjZSVyyX5L/B4iQQwqRZ765qfJkWJ+C
         H2zdy/A3AQxjoK1TvSvdA8EKSG+2a8JAjiRMQuMTt6vEfVXtp6AXeD/W/zZzOYRfVFaJ
         0Vv0zEwsiGFtdako1DPbcKENjfW/iRD6GC9r1aP6O0pGHtbFnCSyl3XUVseoi1sPueLB
         mL1A==
X-Gm-Message-State: APuU4Z9P63XvJYm06bde58aoB5c4YXS8+4J5CGispYC9dShqYEyP5M0T
	etwnW2FljgAIHtdNrgQdao6zxC/5P8F3Z5ycVqsS6ZouyXJo8k4IvkPvgk0+411I6O9YG2M=
X-Gm-Gg: AYBFou0AMPDXJLB/Pee0QRYzLRilhOwgdUSgpyPfUcP0wlEtYiQt9QoYLow/jGIaeM0
	6JLY0NzTYiRQtL+Wtb/CUNPUUZ3ECSHKUCCrSKjbYgJsq1M2rISS7UaE+47WyrIK6wH1qFgqfqz
	Du54X8pBEOYjSmCnlAGXX6niDG10QZY2XKjEhnhvrP7F2xOdseJGpTB0+nYcHi0TlVp0AYFwAju
	lbv4REzvv69gpEA9oamRKYoJ47Cuhdttn2CfONgqiJWxtS7afSCxp0uOg1H0elKQQMfrCc5pCwi
	F+tf+UnCXYlwE3bj2P7tk02JNQAzPA1VGI9WJRFDU/z6nLvDZslLzmbOoAWr0Y1k8JGVamHLeK8
	K7tDcXbyeUCUeOUMH1H1OUjzX+YpzeT15S4Wm6Ft+AIJlMcFaDCS0g76ryD68ag2qu1hI9qk9xj
	e4Zjwe/uP6w21uAfXYGqHnqzZ4CIJYuN+HqDnIl9qli3pxYKhSm4KiRdVG0j3Zy3cUUCA3Ma0fX
	ys5Lbzghz+G4VrjcJVangf7lS2XPY8yCxT6Aa7EJLRH0y8uq5I0HKYf+ik58deG5DIV/obWKWsB
	4QHt9Bp9Kphb1H2+zGUfBllYMXwFHmRsXMt+Bg2ylTX1ZWWgMVmGOVR8MuSI3TNhLetjUIJfjZE
	FNj7iQBVhsE8KjA==
X-Received: by 2002:a05:622a:651:b0:545:de78:a6fb with SMTP id d75a77b69052e-55d5a5b4e35mr96272451cf.33.1795091589892;
        Thu, 19 Nov 2026 04:33:09 -0800 (PST)
Received: from Ixchel.lan (bras-base-mtrlpq3328w-grc-1-70-49-63-180.dsl.bell.ca. [70.49.63.180])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921149f58dbsm48527616d6.6.2026.11.19.04.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:33:09 -0800 (PST)
From: Vlad Banea <montrealtango@gmail.com>
To: netdev@vger.kernel.org
Cc: hkallweit1@gmail.com,
	javen_xu@realsil.com.cn,
	nic_swsd@realtek.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC net-next 0/5] r8169: RSS for the RTL8125B
Date: Thu, 19 Nov 2026 07:33:05 -0500
Message-ID: <20261119123305.2459069-1-montrealtango@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111220114.3863505-1-montrealtango@gmail.com>
References: <20261111220114.3863505-1-montrealtango@gmail.com>
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

Hi Heiner, Javen,

Gentle ping on this RFC. It still applies to net-next.

The question I'm least sure about is patch 1: is the RTL8127A affected
by the same TX descriptor race? If so, I'll send patch 1 to net as a
fix on its own. Comments on the overall approach for the RTL8125B would
also help before I send a non-RFC version.

Thanks,
Vlad
