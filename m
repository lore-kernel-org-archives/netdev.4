Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795014487;
	b=RJ/sZmfUXPg98xo1Mu2vzgN4JfEPuBcu2vJlSDwcwIe+h55nNst6rssWB+aMXMNLyL+9
	 rUaXZkudnSLIyfeWQogYnQRpfALWM7AEZx+qPYMS2sBuKpFfGHfKHOkX8sdXvhIvBM1zd
	 s65zTjadY/ZI8LyW2R8Wc1d738LxaMLXptyqQldwDOV7L90eke+9CWqPuQd7wSyULcni4
	 yKlpagWfVkdvohYZjz33cO9mtOqAz2/yfd1ZAvoni+976F3jdVOF9h+la3A9wRcygti8j
	 zXpPo/qg6/7L2FyYU72muFaWkD/sd9ddlXa8mJ9ocnmMQHbnq/dGBdtugOeys0Hev9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795014487;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:Date:Message-ID;
	bh=xpex8h9KXZTzep5IjaDsbDWyCTG9jycNX6z7ZETT60c=;
	b=SVmXbG1PisXdN4eNWsiDuKr96dbWGrZK8grw58qVPVWP9VNmwfyTPB4ZYMfNUei3ymS+
	 YKyYIlEzMH40F0ERduOOPXeGGwmVyohss/r2lapxYgcTk9ewN5S/Zl1tk63z+/1fH+X/0
	 q7idexHg2wc7IGSRRAXvJA061pfOFo8boNCbXSklVMiuf0Ds80N30YK67MjtYnTLY/aOL
	 PGVIHwl4Hhdtr/k6exiIn1M5xRBaQXZS/h081DN4/n7so9u7x2dQNGq7U0DO8jEG2Cuhu
	 SaUKJ75wTmmaZrIrXV4BmqbbDuI/flQU750XPOSdGQSUV1dKlTFcNggrM8XUP94C8yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=janc3HRm;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9703C606A31C;
	Wed, 18 Nov 2026 15:08:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9703C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=janc3HRm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=janc3HRmCNoa6VPUseRn9Ww3ZMaitPrU/Z+F6dsTdtKnZM6zI4jpvI+Ce+p82W0rK1wReBI75C03T
	 XIyKjH+F74/lnzUcNslqxO+w6zgzVUzZ+VilUQhksgr6llKwcZxDQOdnnNyPVLfZtwonNG8k9EdySY
	 7PLxu+wWI0NkpuGk=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46afdbf5098f-b4d9f;
	Wed, 18 Nov 2026 23:08:00 +0800 (CST)
X-RM-TRANSID:2ee46afdbf5098f-b4d9f
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from [198.18.0.29] (unknown[112.23.105.246])
	by rmsmtp-syy-appsvr03-12003 (RichMail) with SMTP id 2ee36afdbf4ee2c-d8788;
	Wed, 18 Nov 2026 23:08:00 +0800 (CST)
X-RM-TRANSID:2ee36afdbf4ee2c-d8788
From: Xia Yan <yanxia@cmss.chinamobile.com>
To: Ralf Lici <ralf@mandelbit.com>
Cc: netdev@vger.kernel.org,
    David Ahern <dsahern@kernel.org>,
    Ido Schimmel <idosch@nvidia.com>,
    "David S. Miller" <davem@davemloft.net>,
    Eric Dumazet <edumazet@kernel.org>,
    Jakub Kicinski <kuba@kernel.org>,
    Paolo Abeni <pabeni@redhat.com>,
    Simon Horman <horms@kernel.org>,
    Neal Cardwell <ncardwell@google.com>,
    Kuniyuki Iwashima <kuniyu@google.com>,
    Steffen Klassert <steffen.klassert@secunet.com>,
    Herbert Xu <herbert@gondor.apana.org.au>,
    Florian Westphal <fw@strlen.de>,
    Sabrina Dubroca <sd@queasysnail.net>,
    Antonio Quartulli <antonio@mandelbit.com>,
    linux-kernel@vger.kernel.org,
    yana06070@163.com
Subject: Re: [PATCH net-next v3 2/3] ipv6: add ip6_dst_lookup_flow_cookie
In-Reply-To: <20261118143909.115729-1-ralf@mandelbit.com>
References: <1794991714000.1115021.7710558447771708161@cmss.chinamobile.com>
    <20261118143909.115729-1-ralf@mandelbit.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Wed, 18 Nov 2026 23:07:51 +0800
Message-ID: <179501447114.1170921.11330282066049286326.ipv6-cookies-review-confirm@cmss.chinamobile.com>

Hi Ralf,

Thanks, that clears it up. I missed the ordering from atomic_try_cmpxchg()
and the window before a new node is stamped. Your plan sounds good.

Reviewed-by: Xia Yan <yanxia@cmss.chinamobile.com>

Thanks,
Xia Yan


