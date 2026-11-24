Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.217
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795489802;
	b=QoaL3n9hItA+tdMWTcdN3g70Wx6JSXqXwJQPdxJ7AJH0bstTdAm6Z6D8HBmaYlE4ZkoG
	 lTNAemuLZN2hAJJX8/PH2Hhwe2JkW317b703Sg8RNCyiRvjGV8ffK9AzCHzu+GZ/aCPRV
	 g822nHJpu++vTxC6VJGkKzH3jrcWOWskWQ2EnFy8I+pPCxsjtRDzYPwe6rRZXxB+Gi1nV
	 7qXnF5hH/keQxK1Uq8zjhGkFqXlfS4YiTjzbfDt3c68DEHS6SWg52wPQWVUlTPBZUOXud
	 fG/Tf3vDbldcExcsxWfasoejmZ66APozUkJHA6GiP3lYjOk2e/drRuTBeZqRaNbK5Kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795489802;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=dhLjDMupbSVP12+TLEZ8Fg/gv+ZsaM2yDTB4sH6nms4=;
	b=BXoZe5WTkDyl4e6B5Q34+PsKzS537+rmT++GkkWhY8tQuKWZKFVuYOGQnT7d4/lEJpHY
	 1VrlOHDPlBTw7sLbPAIlxHC6zSWeMMqH0gxyB8S/PbFa/Jq3Q+GlfZEuIRKCmbexlZarU
	 2I3F/JFg8zy77t2OddNlmqJNPLQgVZjVrzPby00yTqW/OwJKIDTz0IVCiZmzYZD7D6Owy
	 wiEbxfvUGx2A7g6PMRcw/3RseIDMQnZP4mEHasqiujHlWx3yDCewqowoPGyZqiycudGAe
	 Jdbw9Kl2r+HDNQZ9Q0AGSbS3I3LgoLMT9WTI8t3nDjgbJb5/2NLuVdX11E6dcRNS0hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=BQPYVGWZ;
	arc=none smtp.remote-ip=113.46.200.217
Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF09606A322
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 03:10:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCF09606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=BQPYVGWZ
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=dhLjDMupbSVP12+TLEZ8Fg/gv+ZsaM2yDTB4sH6nms4=;
	b=BQPYVGWZAw79UC1dYhJGkyzvS3PCDapkVazKCdviJ0MGWGUJUglWtD+yFVADAyEGP0qnrU3Nm
	Ue8JKFmMMn5QD0/r3OJJ8gkwChUKbp9xWRBYPXWBXpLkYA6W+JHnrVK9dUi1WmJxpylX1nSZlCt
	jY2kMSVkwEBisQ62Zhomr+4=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4jYSSd74kczcZyJ;
	Tue, 24 Nov 2026 11:08:49 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 1D2484056E;
	Tue, 24 Nov 2026 11:09:53 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 24 Nov
 2026 11:09:52 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <cai.huoqing@linux.dev>, <andrew+netdev@lunn.ch>, <davem@davemloft.net>,
	<edumazet@kernel.org>, <kuba@kernel.org>, <pabeni@redhat.com>,
	<netdev@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH net v2 0/2] net: hinic: Don't fail probe when firmware lacks rx-vlan-filter
Date: Tue, 24 Nov 2026 11:09:44 +0800
Message-ID: <20261124030946.1229396-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
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
Content-Type: text/plain
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)

Fix two hinic bugs, don't fail probe when firmware lacks rx-vlan-filter,
and zero-initialise the VLAN filter request.

Changes in v2:
- Zero-initialise the VLAN filter request.
- Fix sashiko issues.
- v1: https://lore.kernel.org/all/20261116021858.273519-1-ruanjinjie@huawei.com/

Link: https://sashiko.dev/#/patchset/20261116021858.273519-1-ruanjinjie%40huawei.com

Jinjie Ruan (2):
  net: hinic: Don't fail probe when firmware lacks rx-vlan-filter
  net: hinic: Zero-initialise the VLAN filter request

 .../net/ethernet/huawei/hinic/hinic_main.c    |  5 +++-
 .../net/ethernet/huawei/hinic/hinic_port.c    | 30 +++++++++++--------
 2 files changed, 22 insertions(+), 13 deletions(-)

-- 
2.34.1

