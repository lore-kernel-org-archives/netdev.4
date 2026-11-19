Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795068462;
	b=X1wSwBoACo3BOU8QgMdTE4fnJdTtHTIRE0688eJaXZO7vPFoTzlF0Cjs4LaLT8mGLmah
	 6r1ReQ9eS0XY/oNOve5cSVu+DyRmaCOxClSbQ9qSlOHT1PHDZpc3C+H1+hHUa9hPSgNFg
	 MDgGoq78vAcjZ6qyegdKb3oxiDEQ2ZBKBX+zUG5vQ4gemycGzTjbSVgNiLeJlRmkcxopV
	 tQQy81gaCoMPMAFmrcIp0VNAYZyqd6mYb5kN34hstHVg2dHhJm2UTbx0wsLYtdie9H3Ed
	 jcNScCMeGyeVNY9djBDAFJ9Ru2G3LoZrvHRJElm8/LfMGXONZSYGQvltXveeIkZIv/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795068462;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1LaS/GrkFbnjIk5Xzu0L3sLhHUPorFeM3TXn24sdksQ=;
	b=GfdHnfXxEQlYeoxUhTuQAyt3zABmRa7FBMFMFVP2cm3uzNHIt2v63MCoCaz0IvQtWtsO
	 4gqTGm1HuVwU6Bu7USDwmVzAyPv9P5FOoU/VYlEIYhSVHm5r6BDs7TCv5IdFAJn/EYLno
	 JNpcUTUIdc7D93HQbj9Nz6C6Aii5hvt4kS7auHFGznrQWdz+mV44Jjnb3ivKNYLelO8oh
	 4TH2h8poag+b2ePCJw9pjIREkuQUcpne1gZwg3DmwCdqRz3ItZt/KKReUDf5HoVpsnvFg
	 elviO86YTu2t743+XWmjK5FIpsPz+reOwei0F5I4Yo/13yFC/vmLhETVBzfzfy/RBpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=rPTrJT6m;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB063606A325;
	Thu, 19 Nov 2026 06:07:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB063606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=rPTrJT6m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=rPTrJT6mACbilHLjtQ9BhH+2+13EhjwBWcSgU7KkgqVEeaQd9cRpdcouzzLve46eUPDKyeU822nRM
	 HHDSF7tGLhXUrfJ7n0Wty/2Pcy22uvpKsvBf4DIkfoyOKIUEwrfRIeMKHhYFy5ut6HlqaGlYiuM13i
	 xkAVExfWnpQHrJEI=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46afe922acf4-ba20b;
	Thu, 19 Nov 2026 14:07:38 +0800 (CST)
X-RM-TRANSID:2ee46afe922acf4-ba20b
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76afe9228f7a-f1b88;
	Thu, 19 Nov 2026 14:07:38 +0800 (CST)
X-RM-TRANSID:2ee76afe9228f7a-f1b88
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: netdev-bot+sinfo@kernel.org
Cc: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>,
	netdev@vger.kernel.org,
	chester.a.unal@arinc9.com,
	daniel@makrotopia.org,
	andrew@lunn.ch,
	olteanv@gmail.com,
	sean.wang@mediatek.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: dsa: mt7530: fix regulator leak in mt7530_setup()
Date: Thu, 19 Nov 2026 14:07:36 +0800
Message-ID: <20261119060736.1152-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <179496613691.3291.15730962134420645853@kernel.org>
References: <179496613691.3291.15730962134420645853@kernel.org>
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

Hi,

On Wed, Nov 18, 2026 at 01:42:16AM +0000, netdev-bot+sinfo@kernel.org wrote:
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by LLM and not proven at runtime). If it was triggered
>    please include the symptoms, like the stack trace or kernel
>    messages.

Please find the information below, for the patch "[PATCH] net: dsa:
mt7530: fix regulator leak in mt7530_setup()":

https://lore.kernel.org/all/20261118014114.1855-1-laixiangwu@cmss.chinamobile.com/

How the issue was discovered: manual code inspection of the error
paths of mt7530_setup(), while auditing DSA drivers for probe-time
resource leaks.  No scanner or LLM was involved.

Whether the issue was actually triggered: no, it is theoretical.  The
leak needs mt7530_setup() to fail after the two regulators have been
enabled (reset timeout, unsupported chip ID, 20MHz XTAL, VLAN setup,
PHY muxing, GPIO setup or FDB flush failure), which does not happen on
a working system.  If it did happen, the symptom would be both the
core and io supplies of the switch staying powered after the failed
probe, and a WARN_ON(enable_count) splat from the regulator core when
the devm-acquired regulator handles are released with a nonzero
enable count.  No such report is known to me.

Hardware the change was tested on: none, the patch was not tested on
real hardware.  The change only routes existing failure branches to
two new error labels calling regulator_disable(), mirroring what
mt7530_remove() already does on the removal path, so the behaviour on
a successful probe is unchanged.

The series is respun as v2 to address the review feedback received on
the list, and the same information is folded into the v2 commit
message:

https://lore.kernel.org/all/20261119060424.1476-1-laixiangwu@cmss.chinamobile.com/

Best regards,
Xiangwu Lai


