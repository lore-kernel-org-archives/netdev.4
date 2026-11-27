Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795754313;
	b=TYHkf+/DFlEqjOfFaybo4ouz77P5u4g0askJs8PQUHPYMDZMY4ZU3470sZfr36y3q+Q2
	 SuVMfsH096tFxSivpdyJo6KRv176ndeDQy2QQS3pLNdxb86x75F5Dld1FDV/jH+RREztN
	 uWmGxXvZmhjAH1EwBqz9R0+CAAu6vG1ZDMhFf+fI5m9TNVX3BVK4c+dto6sqxl7JqJNeZ
	 W7ZYKvZ4hPpTet6eOIvhCK6bM20xwHo7YoFAy9iB1k0ShYbuNq5SHzias5CfjwG5wC9kP
	 Oj1aTINpHjhynMcCz5AfGZKgCBSyE9TcrcvEv82gBOyQqrORn+bXQ0ywFhhMEp+PQ+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795754313;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=N1T0evME3yiI8dB4BC7sUR9jHQxNyppjV0Y1RlmSCUc=;
	b=mVSEFTustrP8c7D9FXO+/uDAHoTG5+j4gUdIFf+wTuTzkL8tAcpehOT5hd0nj1mtMppl
	 v83Y2pqw6Mxhmkz2stfyRqn8CPIwJJ65SBmKqkzSZ49LQM0KYUwp2GDCWb5nBTCeOKJg1
	 +KRN8EbRQVFTnMhRHJsSOZEVTsc4Z/hFqheUF3AKTeUt4ajlbsKAQNWAhkVhBu6T2tKI1
	 Tc/h1gwRkInBPo2k+M4YLRKmVd7zmmWTsNsmycV3VctcHMD/QLdmlHFs1yGiJ9+ECEKQw
	 L4ljZl2lWdKQ1Pr77EZEu5S07odDEbLDz3H83/c5MQZHe1b8SFbQnuzsNTBmPrTOIrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Y7xS3rW+;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7FB606A33D
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 04:38:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E7FB606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Y7xS3rW+
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1ae58d17cd9so8669617c88.1
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 20:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1795754311; x=1796359111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N1T0evME3yiI8dB4BC7sUR9jHQxNyppjV0Y1RlmSCUc=;
        b=Y7xS3rW+y2a5KajpD5g8Ipa3HbLgBxepzUSdyRpHaW/E/omWMWRrN2OwgOx8moZZ3z
         EZY++J+k8/UW3xjUWn6LiQkxUXEDlEtirAdN0/vI/qD1ESkWPQro0ZMpMc9Y2X4L7CEB
         u9v3L8peWjNOrmjQeMjOkUvu9xsiOpfnc/diTL97ThKkYGVha9ujDkaJ5MEJ8Oc5+V1C
         xLvSgvehMY3CvoPT7s8IC+zCgcF/TwmJis6Eo/OdmoyAWFkSqVDp/hhN0qy9GSQrtN39
         qpgcVq767pEgKvicm9JGqeqt5I2rGrVfPzP6uOG6sbv3LY/Vz55Zl4ugoms2WAX15ATT
         BzWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795754311; x=1796359111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N1T0evME3yiI8dB4BC7sUR9jHQxNyppjV0Y1RlmSCUc=;
        b=gNV8lxocO1kWIW2/ZNP4t4uu4F4z0cMC491OMN2JJRxwaojGkYYCrQvuRBOMsLR3nN
         lYngTxM1XyzQHQvasvxYOlv2S8GJT7UyjXHBARqupPsvjxYg4GSveVsMvKRD4ZVeKU80
         Factkl2TVLwumixhPCETPms5eKq/16gzxTYbDVpCAUn1pZjL8QhkQilpfXPJzn/kT1nz
         zH1VepIcqLNBbcFSgDHkQn1bR6C8zE29LFpmgakJ8ALtb07CqPmMGa6EF4OwujuRsmPf
         uae6ut/y7+hqPgvikkgkdjfcdjUDEEmYxZnKyI7lPlkTDciwdS+iYSQNBlVWnh9R85gE
         AG7Q==
X-Forwarded-Encrypted: i=1; AL+hErGTg0B7eZRRJR/T0lMZjnQFh6NxWJObMSuek0NDvq6wolvQBT/G4DP++Msyxc+tmc5l5JhdpUU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/88WRr+f314NMDfBgfGilOEU8sKBcgFD5L/RucfGUipBerdTUX
	m4WvDs/19e2SDJitnn42q0KqLtSVUwww8ly4Oo8K5E5xdiy+J45JfHhGdzLeKrcezg==
X-Gm-Gg: AZFdTZcEqVNYEyRBlFBYwCyyA2eYnBXcoQ7QmS5gWb4nFisJD8ZpuX+OUL83jtGtifw
	GXNMaejOVkhqOihBxUf26KySBNUxFsxvA/oIGMT5nS0CAdmArNgOFYbUBW4tLvS5YfeIlPpix07
	t3fO2XhNn3F8pAmUQ6zUmuI7tisf61rxMzsup4cn4jxhSRxE6ue3XQRKFX7lMUKTgao7LPDsBYy
	Kp76xypHyPxgbNwGAj1H4VEg+raLskZFWIefItlEDIJWjsfte0jokwhOGW5xabCI8fQYtId3ffA
	kaH+HjqZ57wOoB2X7ms4dGMoU9352XmKneL+LpY4q5hvBFckK4jTr+QF7I0632/XktG9Lt6RqWJ
	DN6FECJUmdb6+Q36MJGJx2Jw9xunCHNYTK9lqoCuIRK8m1tZpRXjQSZjw+2QClEPhKIU7cx3ZW8
	4sYZ1HGL7R8kuStrVF6l8ts8BlsgYB3GbXcJj4NjwxLWxgDENe8po3a2uTGxjHx8OMNyZsQs01Y
	hZBNB/EZWU4RXGToX/Ke7UKJhGjTiUPZleTwu9qNDAJcE9AsSZEiogjYmfXne8wV2df9g4NEfm/
	pwu8PKlbZ64fgsS9N99jX6MAVGj3Kf9OcKsMCzhVXSmQ1CxKuMxPvcRC+kPXPC8BBdImsgWkHH+
	Anq+eovwmFLYHMrkqkw==
X-Received: by 2002:a05:701b:4513:20b0:14a:d8fe:3390 with SMTP id a92af1059eb24-1b5568cf65bmr22258739c88.32.1795754311354;
        Thu, 26 Nov 2026 20:38:31 -0800 (PST)
Received: from cantal.lan ([58.136.75.118])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ff27bsm60732658c88.6.2026.11.26.20.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:38:30 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: netdev-bot+sashiko@kernel.org
Cc: maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	rohan.g.thomas@altera.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	alex.cramt@gmail.com
Subject: Re: [PATCH net] net: stmmac: dwmac-socfpga: disable split header on Agilex 5
Date: Fri, 27 Nov 2026 11:38:25 +0700
Message-ID: <20261127043825.601200-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <179574936116.3135.3699981290049268393@kernel.org>
References: <20261126031300.211248-1-jjc@jclark.com> <179574936116.3135.3699981290049268393@kernel.org>
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

On Fri, 27 Nov 2026 03:16:01 +0000, netdev-bot+sashiko@kernel.org wrote:
> Is the root cause specific to Agilex 5, or does it affect all XGMAC
> users?

Probably not specific to Agilex 5. When the same failure was fixed for
Intel in 47f753c1108e, Intel reported that "according to Synopsys IP
support, they have confirmed the header-payload splitting for IPv4
fragmented packets is not supported for the Synopsys Ether IPs":

https://lore.kernel.org/all/20220428015538.GC26326@linux.intel.com/

So it looks like a limitation of the IP, not a bug in the driver's RX
path.

> If the corruption actually comes from this shared dwxgmac2 header
> length handling, would it be better to fix it in the core instead of
> adding a per-platform flag? That would also let Agilex 5 keep split
> header enabled.

If split header does not support fragments, there is nothing to fix in
the RX path, and Agilex 5 cannot keep split header on. A general fix
would mean not enabling split header by default, which would affect
every stmmac platform. Agilex 5 is the only XGMAC hardware I have, so
I have done what the other seven glue drivers do: disable it for the
platform I could test.

James
