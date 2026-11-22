Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795355283;
	b=XxkjwBKNRxvF9EHgon9EXJjQvEFAD6QKr3I2glm2DYgU8sHdXmWL1cD+HlbseeR5RUVj
	 uuFwWTNALY9JFCtfBwpsRVEwalsY7e86PQ+XuUgGL1R7D1KCKOrijB9YHvDEQJZA4JhDa
	 VH3lhk5trUQIMuxQli3NWyrMFyM70QyUMrp1lU3mfm2GdstR/Np1/+aAOftVYj8cCVE72
	 XJB482y25X56Tg446sJKcYCiSEBvkm5RX8Wbxo4SIHyBR4WKMaUCaBArKdGL+YiOXujGT
	 Zfu7gfSSBsJ4ws7zRb4e6zPn2/faIWcf+wIAFxenSHISm4lY9dXir6hlbiTOY7BnKbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795355283;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Date:Message-ID;
	bh=pH9D14oV3PRNkG+sp4sqsu7DKP2vzYxKzaDvHbV0J/U=;
	b=A22ZKsDRg/Hp1Godq79Pbgviy8z9TrweRQXEcKu67xvZm0PtcW8seUE133MVQPxFQjg+
	 d0nbgLfa0MiPlLYLto0vVK/pyCBhkI4CLXoOk24YOSH9DNmYRDwFCY1CKcD48lHcAUCCd
	 nd6pIMtexx79611+8v2S71+bJ8xYH+4D5yCwteeIH0hshITdC4SWgUOFoVCYPKG6BLNKH
	 cMiR8oWl0NlJSuUiyWsPWhCg2HkHSOaj+yBMdYjcBuUZWdxODKuwALI97L6XniHk0vXja
	 T7X2InhwMmssDsbmawpfnH7qWfzHsD/mGQzUpDoep5KVRf9kUiv4IhTsxcK8I6VECcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=S0ZIaKbJ;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6235E606A320;
	Sun, 22 Nov 2026 13:48:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6235E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=S0ZIaKbJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=S0ZIaKbJf9Gatq1o5xE7fDSAdDTkJeoj3WuzpAmgQvrNXvta9JWTesB8iPLalSpKDVAJk7F+/plsf
	 srHQ0vreCX5LQjPtlyvHzH7o4nbRn9rS0oz7j+Ebyq7XY1XRbiQCjKU5iycseTlUFsFwmBMSQ8A9r1
	 XVfuJBbzeUuuvVZY=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86b02f289600-d3e2a;
	Sun, 22 Nov 2026 21:47:53 +0800 (CST)
X-RM-TRANSID:2ee86b02f289600-d3e2a
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from [198.18.0.139] (unknown[112.23.105.246])
	by rmsmtp-syy-appsvr03-12003 (RichMail) with SMTP id 2ee36b02f285db1-889ce;
	Sun, 22 Nov 2026 21:47:53 +0800 (CST)
X-RM-TRANSID:2ee36b02f285db1-889ce
From: Xia Yan <yanxia@cmss.chinamobile.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: netdev@vger.kernel.org, dsahern@kernel.org, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, linux-kernel@vger.kernel.org, kuniyu@google.com,
 xeb@mail.ru, yana06070@163.com, netdev-bot+sashiko@kernel.org
Subject: Re: [PATCH net-next v4] ip6_gre: fix changelink conflict checks for
 L2 tunnels
In-Reply-To: <20261122123555.GA2812544@shredder>
References: <179491056935.741041.1816208847037703396.ip6gre-v4@cmss.chinamobile.com>
 <20261122123555.GA2812544@shredder>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Date: Sun, 22 Nov 2026 21:46:46 +0800
Message-ID: <179535520659.1246754.6272249611130171705.ip6gre-v5-followup@cmss.chinamobile.com>

Hi Ido,

Thanks for the review. I've sent v5 with just the one-line v1 change:
https://lore.kernel.org/netdev/179535496489.1244648.10031965997557933761.ip6gre-v5@cmss.chinamobile.com/

Thanks,
Xia Yan

pw-bot: cr


