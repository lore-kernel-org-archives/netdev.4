Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.244.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705297;
	b=Pl5mP/jwXakDCbvPdqZadOtoCZ+fl18EY523MjDnmSTsh5UqTtVB3Bak/P006oG+KCiI
	 GnZpXAKXOhL66oSqz9TaCLv+t1TFPcKBwyM1lH6gOHKOmtieMxTS/NxZFuHmInqXa+xHc
	 6CNPr9/1wwaLdIU7pprJ/+a1P2mNEuTm6+tmKj7Wdp5ReJF1P+ZmlhFH7i7d4JXFLW1Lp
	 yk3lYG92Fadv4Z1UaD525XnfgvtcMqAQcixYxYL2H0/jrKNZ5IGtM4vFl9JWTW1/uf85y
	 4JTowM4RM8vAFutmWdNNWGm8To0v8zQWUQH1QFDBQZ3/g1rRCNuSeYEepfaQ/QRnvcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705297;
	h=DMARC-Filter:DKIM-Signature:Received:To:Subject:X-PHP-Script:
	 X-PHP-Originating-Script:Date:From:Reply-To:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-Get-Message-Sender-Via:
	 X-Authenticated-Sender:X-Source:X-Source-Args:X-Source-Dir;
	bh=Dp2z85quoyOeIYxG8YBwyiZVUBKOcuHOwE1lWycAtuE=;
	b=Zv6/YPE3Y6c3dtncRWe0jfVC5g/QF0Y5pa7QRdAVZnU0Etmc/mw8u+K+HcTfFm5i2gty
	 G829eCq38TU+4LpXHhubOKi52hLV5mCkLYFF47sfR1dQN+r3yHiAr1l2hERezgnQpuVha
	 21ozKx/ysXKkAxldhrAI3scr/SY21MzojyXdZISn+6r1PyRPZeP8vO4Yz3xTVjdy/OoQm
	 7IBc0JG0wCwj5yMA5+qx/m/hRgd+23uTembXI33Ygy9Xu93CJpmrSVl4pOEom3hbFbYjx
	 l65GHp06tUHOIc1ebtFcIHUK+i4SwwlWr1QY4Z1Mj4I3NPAhkSsD9n7kxnxZsMGvCAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=visefest.no;
	spf=pass smtp.mailfrom=visefest.no;
	dkim=pass header.d=visefest.no header.i=@visefest.no header.a=rsa-sha256 header.s=default header.b=l4ZUtyOU;
	arc=none smtp.remote-ip=67.231.244.115
Received: from nicolayleganger.no (nicolayleganger.no [67.231.244.115])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E47606A31E
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 15:01:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21E47606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=visefest.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=visefest.no
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=visefest.no header.i=@visefest.no header.a=rsa-sha256 header.s=default header.b=l4ZUtyOU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=visefest.no
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID
	:Reply-To:From:Date:Subject:To:Sender:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Dp2z85quoyOeIYxG8YBwyiZVUBKOcuHOwE1lWycAtuE=; b=l4ZUtyOUS2gIWKIPu2hFbcXmjr
	RIcPscl4AyJoAkglnON+BLLjPdRLOYDvNQA6WRft6gcI7LvYpjfrPxYsqJPcxaNYuUEqCd7opK2jt
	9mO6n47NYBF2Nede96xlRmEGwrlvk1wxz5VmWzW37ClYsHzHohbSc/AtoBmXG9MBWdTR6Yq2vUh2n
	TZzl7sFtloZ71sPG2kN+JEkGvcRRoahXnuY0hkaZXnfGJ8NP83CYmdUHYi5/uSkPhwWDRZVC60nTm
	wV5nBzn7kFLHzoxs0SUzjtBN/A9WTQHEHTM6H0YZO15mR3mhVOU1RJm3EZAlQ55EFp4C8OlIqUTMK
	ZohjLmKw==;
Received: from nicolayl by webserver96.turnkeywebspace.com with local (Exim 4.100.1)
	(envelope-from <support@visefest.no>)
	id 1xWayX-000000015yW-2Bsu
	for netdev@vger.kernel.org;
	Thu, 26 Nov 2026 10:01:29 -0500
To: netdev@vger.kernel.org
Subject: AR Position/Remote Position
X-PHP-Script: visefest.no/g1xhsro/vpladmw/sflzhrg/index.php for 191.101.51.108
X-PHP-Originating-Script: 1009:index.php
Date: Thu, 26 Nov 2026 10:01:29 -0500
From: Nico Nego <support@visefest.no>
Reply-To: nico.nego@nicnegometalworks.com
Message-ID: <8cdc4a238ea5376b1599051da9db569f@visefest.no>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - webserver96.turnkeywebspace.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [1009 992] / [47 12]
X-AntiAbuse: Sender Address Domain - visefest.no
X-Get-Message-Sender-Via: webserver96.turnkeywebspace.com: authenticated_id: nicolayl/from_h
X-Authenticated-Sender: webserver96.turnkeywebspace.com: support@visefest.no
X-Source: 
X-Source-Args: php-fpm: pool visefest_no                                
X-Source-Dir: nicolayleganger.no:/visefest.no/g1xhsro/vpladmw/sflzhrg

﻿Hello,

We would like to engage your services as our Accounts Receivable Representative to manage and collect overdue payments from our North American clients. In this remote role, you will use standard, straightforward communication channels to engage with clients regarding overdue accounts. The process is designed to be entirely friction-free, requiring no travel or physical client visits. All client interactions can be managed efficiently from your location via telephone and email, with no specialized software or complex system integration required on your end.

For every account assigned, we will provide you with a comprehensive documentation package, including the invoice copies, shipment documents, and complete customer contact details.

Financial Terms & Compensation

We offer a highly competitive compensation structure for your representation, which includes both a monthly fixed salary and a percentage-based commission:

• Monthly Salary: A flat retainer of $6,200 USD per month.

• Collection Incentives (30% Total Deduction):
	• 10% Collection Fee / Commission
	• 20% Allocated for Local Taxes

• Net Remittance: Your firm will deduct the 30% combined fee from every payment collected and remit the 70% NET balance to our company.

Payment Logistics
Depending on the specific arrangement made with each customer, payments will be collected via:

• Cashier's Check
• Wire Transfer

We are eager to establish this partnership and move forward quickly. Please review this proposal and let us know your decision at your earliest convenience so we can discuss the next steps and formalize an agreement.

Thank you for your time and consideration. I look forward to your prompt response.

Sincerely,

Nico A. Nego
PT. Nico Metal Indonesia
JL. Kran 3 Dalam No 7A 06/05,
Gunung Sahari Selatan, Kemayoran,
Jakarta Pusat 10610 
Indonesia
nico.nego@nicnegometalworks.com

